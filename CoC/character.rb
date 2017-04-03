require 'yaml'
class Character
  def initialize()
    @name = "Unknown"
    @stats = {}
    @skills = {}
    @status = {}
  end

  def initialize(name, stats, skills, status)
    @name = name
    @stats = stats
    @skills = skills
    @status = status
  end

  def saveCharacter()
    File.open("#{@name.delete(' ')}.yml", "w") {|f| f.write(self.to_yaml) }
  end

end
