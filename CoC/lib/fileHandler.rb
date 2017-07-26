require 'yaml'


#This is stuff that is more specifically for creating a character
module FileHandler

  #TODO could create a generic getter, give layout, but prefer this style for readability
  def loadCharacter(name)
    name = name.gsub(' ', '_')
    YAML.load_file("#{Dir.pwd}/Characters/#{name}.yml")
  end

  def loadWeaponList()
    YAML.load_file("#{Dir.pwd}/lib/yml/weaponList.yml")
  end

  def saveWeaponList(weaponList)
    File.open(File.expand_path("#{Dir.pwd}/lib/yml/weaponList.yml"), "w") {|f| f.write(weaponList.to_yaml) }
  end

  def getStatNames()
    File.readlines("#{Dir.pwd}/lib/txt/Stats.txt")
  end

  def getSkillDefaults()
    YAML.load_file("#{Dir.pwd}/lib/yml/Skills.yml")
  end

  def getFormatted(input = gets.chomp)
    input = input.split.map(&:capitalize).join(' ')
  end

  def getOccupationList()
    YAML.load_file("#{Dir.pwd}/lib/yml/Occupations.yml")
  end

  def getMaleNames()
    File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/maleNames.txt")
  end

  def getFemaleNames()
    File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/femaleNames.txt")
  end

  def getSurnames()
    File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/surNames.txt")
  end

  def saveOccupationsYML(occupations)
    File.open(File.expand_path("#{Dir.pwd}/lib/yml/Occupations.yml"), "w") {|f| f.write(occupations.to_yaml) }
  end

  def getStatusNames()
    File.readlines("#{Dir.pwd}/lib/txt/status.txt")
  end


end
