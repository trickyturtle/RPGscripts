require 'yaml'
class Character

  #TODO Joe here I am initializing default values. Initialize is the constructor method in ruby
  def initialize(name = "Default", stats = {}, skills = {}, status = {})
    @name = name
    statNames = File.readlines("#{File.expand_path(Dir.pwd)}/lib/Stats.txt")
    @stats = {}
    for stat in statNames
      @stats[:stat] = 0
    end
    @skills = skills
    @status = status
  end

  def saveCharacter()
    File.open(File.expand_path("Characters/#{@name.delete(' ')}.yml"), "w") {|f| f.write(self.to_yaml) }
  end

  def loadCharacter(filename)
    character = YAML.load_file("#{filename}")
    puts character.inspect
  end

end
