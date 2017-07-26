require 'yaml'
require_relative '../../../lib/dice'
require_relative '../fileHandler'
class Character
  include Dice
  include FileHandler

  attr_accessor :skills, :name, :stats, :weapons, :backstory, :equipment, :status

  #TODO Joe here I am initializing default values. Initialize is the constructor method in ruby
  def initialize()
    @name = "Default"
    statNames = getStatNames()
    @stats = {}
    for stat in statNames
      @stats[stat.chomp] = 0
    end

    @skills = getSkillDefaults()

    @backStory = {}
    @equipment = {}
    @status = {}
  end

  def train(skill)
    if !@status["Trained Skills"].include?(skill)
      @status["Trained Skills"].push(skill)
    end
  end

  def saveCharacter()
    File.open(File.expand_path("Characters/#{@name.gsub(' ', '_')}.yml"), "w") {|f| f.write(self.to_yaml) }
  end

  def learn()
    improvementRoll = D(100)
    if improvementRoll > self.stats["Education"]
      self.stats["Education"] += D(10)
    end
  end

  def physicallyAge(decrease)
    newStr = D(10)
    newDex = D(10)
    newCon = D(10)
    total = newCon + newDex + newStr
    @stats["Strength"] -= (newStr * decrease / total).to_i
    @stats["Dexterity"] -= (newDex * decrease / total).to_i
    @stats["Constitution"] -= (newCon * decrease / total).to_i
  end

  #This should only occur at creation.
  def applyAge()
    #TODO apply movment penalties
    if @stats["Age"] < 15
      @stats["Strength"] -= D(10)
      @stats["Size"] -= D(10)
      @stats["Education"] -= 10
      newLuck = roll(6, 3) * 5
      if newLuck > @stats["Luck"]
        @stats["Luck"] = newLuck
      end
    elsif @stats["Age"] < 20
      ageDecrease = D(5)
      @stats["Strength"] -= ageDecrease
      @stats["Size"] -= (5 - ageDecrease)
      @stats["Education"] -= 5
      newLuck = roll(6, 3) * 5
      if newLuck > @stats["Luck"]
        @stats["Luck"] = newLuck
      end
    elsif @stats["Age"] < 40
      #TODO Joe, self is exactly what is sounds like. the object tells itself to run the function. Often it isn't needed (it's usually implied by the scope), I just put it in for clarity. By that I mean self.learn() will do the exact same thing here as learn()
      self.learn()

    elsif @stats["Age"] < 50
      2.times do self.learn()
      end
      @stats["Appearance"] -= 5
      self.physicallyAge(5)


    elsif @stats["Age"] < 60
      3.times do self.learn()
      end
      @stats["Appearance"] -= 10
      self.physicallyAge(10)


    elsif @stats["Age"] < 70
      4.times do self.learn()
      end
      @stats["Appearance"] -= 15
      self.physicallyAge(20)

    elsif @stats["Age"] < 80
      4.times do self.learn()
      end
      @stats["Appearance"] -= 20
      self.physicallyAge(40)

    elsif @stats["Age"] < 90
      4.times do self.learn()
      end
      @stats["Appearance"] -= 25
      self.physicallyAge(80)
    end
  end
end
