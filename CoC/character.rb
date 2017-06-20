require 'yaml'
class Character
  attr_accessor :skills :name :stats :weapons :backstory :equipment :status

  #TODO Joe here I am initializing default values. Initialize is the constructor method in ruby
  def initialize()
    @name = "Default"
    statNames = File.readlines("#{File.expand_path(Dir.pwd)}/lib/Stats.txt")
    @stats = {}
    for stat in statNames
      @stats[:stat] = 0
    end
    @skills = YAML.load_file("Skills.yml")
    @weapons = {}
    @backStory = {}
    @equipment = {}
    @status = {}
  end

  def saveCharacter()
    File.open(File.expand_path("Characters/#{@name.delete(' ')}.yml"), "w") {|f| f.write(self.to_yaml) }
  end

  def loadCharacter(filename)
    character = YAML.load_file("#{filename}")
    puts character.inspect
  end

end
