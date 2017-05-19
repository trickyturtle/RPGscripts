require 'character'
class CreateCharacter
  def initialize()
    @character = Character.new
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
    puts "Enter Strength:"
    @str = gets.chomp
  end

  def getOccupation()
  end

  def getSkills()
  end

  def getBackStory()
  end

  def getEquipment()
  end

end
