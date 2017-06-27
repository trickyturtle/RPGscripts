require 'character'
require 'lib/occupation'
require 'yaml'
class CreateCharacter
  def initialize()
    @character = Character.new
    @occupation = nil

    getName()
    #TODO add how many points are available
    getStats()
    getOccupation()
    #puts "You have #{jobPoints} occupation points to spend"
    #puts "and #{interestPoints} interest points to spend"
    getSkills()
    getBackStory()
    getEquipment()
    @character.saveCharacter()

  end

  def getName()
    puts "(C)reate Name"
    puts "(G)enerate Random Name"
    input = gets.chomp
    if input.upcase == "C"
      puts "Enter name:"
      @character.name = gets.chomp
    else
      puts "Enter Gender (M/F):"
      input = gets.chomp
      generateName(input)
    end
  end

  #M denotes male, anything else is female
  def generateName(gender)
    if gender.upcase = "M"
      firstNames = File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/maleNames.txt")
    else
      firstNames = File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/femaleNames.txt")
    end
    lastNames = File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/surNames.txt")
    name = "#{firstNames[rand(firstNames.size)]} #{lastNames[rand(lastNames.size)]}"

    puts "(U)se this name or (G)enerate another?"
    input = gets.chomp
    if input == "U"
      @character.name
    else
      generateName(gender)
    end
  end

  def getStats()
    puts "Enter Stats"
    stats = File.readlines("#{Dir.pwd)}/lib/Stats.txt")
    for stat in stats
      puts ""
      puts "Enter #{stat}: "
      @character.stats[stat] = gets.chomp.to_i
    end
  end

  def getOccupation()
    #TODO refactor
    @occupation = Occupation.new
  end

  # def getSkills()
  #   puts "Enter 'exit' as a skill to stop"
  #   puts "Enter skill name: "
  #
  #   while (skillInput = gets.chomp).downcase != "exit"
  #     getSkill(skillInput)
  #     puts ""
  #     puts "Enter skill name: "
  #   end
  # end

  def getSkills()
    getThings("Skills", "getSkill")
  end

  def getSkill(skillInput)
    puts ""
    puts "Enter num points to add"
    numInput = gets.chomp
    puts ""

    while !(@character.skills.key?(input))
      puts "Not a skill, check spelling and re-enter skill: "
      skillInput = gets.chomp
    end

    @character.skills[skillInput] += numInput
  end

  def getBackStory()
    puts "Not implemented yet!"
  end

  def getEquipment()
    getThings("Weapons", 'getWeapon')
  end

  def getThings(type, getterMethod)
    puts "Enter 'exit' as a #{type} to stop"
    puts "Enter #{type} name: "

    while (thingName = gets.chomp).downcase != "exit"
      send(:getterMethod, :thingName)
      puts ""
      puts "Enter #{type} name: "
    end
  end

  def getWeapon(weaponName)
    puts ""
    @character.equipment["Weapons"][weaponName]
    @character.skills[skillInput] += numInput
  end

end
