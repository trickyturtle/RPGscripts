require_relative 'character'
require_relative '../occupation'
require_relative '../weapons/weaponRetriever'
require 'yaml'
require_relative '../fileHandler'

class CreateCharacter
  include WeaponRetriever
  include FileHandler

  def initialize()
    @character = Character.new()
    @occupation = nil

    setName()
    #TODO add how many points are available
    getStats()
    adjustNumbers()
    getOccupation()
    setInitialStatus()

    jobPoints = getJobPoints()
    puts "\nYou have #{jobPoints} occupation points to spend"

    interestPoints = @character.stats["Intelligence"] * 2
    puts "and #{interestPoints} interest points to spend\n"
    @spentPoints = 0
    @totalPoints = jobPoints + interestPoints

    puts "Enter character skill points"
    puts "To do this, enter a skill name, and the number of skill points to add"
    getSkills()
    getBackStory()
    getEquipment()

    @character.saveCharacter()
  end

  def adjustNumbers()
    puts "\ndo you want to age?"
    if @character.stats["Age"] && (input = gets.chomp) == "yes"
      @character.applyAge()
    end
  end

  def setName()
    puts "What is your name?"
    puts "(C)reate Name"
    puts "(G)enerate Random Name"
    input = gets.chomp
    if input.upcase == "C"
      puts "Enter name:"
      @character.name = getFormatted()
    else
      puts "Enter Gender (M/F):"
      input = gets.chomp
      generateName(input)
    end
  end

  #M denotes male, anything else is female
  #TODO refactor
  def generateName(gender)
    if gender.upcase == "M"
      firstNames = getMaleNames()
    else
      firstNames = getFemaleNames()
    end
    lastNames = getSurnames()
    name = "#{firstNames[rand(firstNames.size)].chomp} #{lastNames[rand(lastNames.size)].chomp}"
    puts "You remember your name is #{name}"
    puts "(U)se this name or (G)enerate another?"
    input = gets.chomp.upcase
    if input == "U"
      @character.name = input
    else
      puts "Wait that isn't it"
      generateName(gender)
    end
  end

  def getStats()
    puts "Enter Stats"
    stats = getStatNames()
    for stat in stats
      puts "\nEnter #{stat} "
      @character.stats[stat.chomp] = gets.chomp.to_i
    end

  end

  def getOccupation()
    puts "Enter Occupation name:"
    #get formatted occupation name
    name = getFormatted
    occupations = getOccupationList()

    if occupations.key?(name)
      @occupation = occupations[name]
    else
      @occupation = Occupation.new()
      occupations[name] = @occupation
      saveOccupationsYML(occupations)
    end
  end

  def getSkills()
    getThings("Skill", :getSkill)
  end

  def getSkill(skillInput)

    while !(@character.skills.key?(skillInput))
      puts "Not a skill, check spelling and re-enter skill: "
      skillInput = getFormatted()
    end
    puts "Points remaining = #{@totalPoints - @spentPoints}"
    puts "Enter num points to add:"
    numInput = gets.chomp.to_i

    @character.skills[skillInput] += numInput
    @spentPoints += numInput
    if (@totalPoints - @spentPoints) < 0
      @character.name = "#{@character.name} the Cheater"
      puts "At #{@totalPoints - @spentPoints} points!"
    end
    if (@totalPoints - @spentPoints) == 0
      puts "Remember, type 'exit' as a skill to exit"
    end
  end

  def getBackStory()
    puts "\nBackstory Not implemented yet!\n"
  end

  def getEquipment()
    @character.equipment["Weapons"] = {}
    getThings("Weapon", :getWeapon)
  end

  def getThings(type, getterMethod)
    puts "Enter 'exit' as a #{type} to stop"
    puts "Enter #{type} name: "

    while (thingName = gets.chomp).downcase != "exit"
      send(getterMethod, thingName)
      puts ""
      puts "Enter #{type} name: "
    end
  end

  def getWeapon(name)
    @character.equipment["Weapons"][name] = retrieveWeapon(name)
  end

  def setInitialStatus()
    statusList = getStatusNames()
    for stat in statusList
      @character.status[stat.chomp] = 0
    end

    @character.status["Max Health"] = (@character.stats["Constitution"] + @character.stats["Size"])/10
    @character.status["Current Health"] = (@character.stats["Constitution"] + @character.stats["Size"])/10

    @character.status["Movement"] = 7
    if(@character.stats["Dexterity"] > @character.stats["Size"] )
      @character.status["Movement"] += 1
    end
    if(@character.stats["Strength"] > @character.stats["Size"] )
      @character.status["Movement"] += 1
    end


    @character.status["Max Sanity"] = @character.stats["Power"]
    @character.status["Current Sanity"] = @character.stats["Power"]
    @character.status["Max Magic"] = (@character.stats["Power"]/5).to_i
    @character.status["Current Magic"] = (@character.stats["Power"]/5).to_i
    @character.status["Trained Skills"] = []
  end

  def getJobPoints()
    points = 0
    for modifier in @occupation.modifier
      index = 0
      max = 0
      while index < modifier.length
        temp = (@character.stats[modifier[index]].to_i * modifier[index+1].to_i)
        if temp > max
          max = temp
        end
        index +=2
        points += max
      end
    end
    points
  end
end