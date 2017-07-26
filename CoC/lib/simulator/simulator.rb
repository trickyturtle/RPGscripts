require 'yaml'
require_relative '../character/character'
require_relative '../../../lib/dice'
require_relative '../fileHandler'

#TODO
# skill checks w/ hard, easy, etc
# tagging skills, checked
# combat

#skillName characterName difficulty roll(zero for auto test)


class Simulator
  include FileHandler

  #TODO RACE CONDITION, need to constantly reload characterList
  def initialize()
    @characterList = []
    puts "Enter a Character in the scenario"
    puts "type exit to finish"
    while (input = getFormatted()).downcase != "exit"
      @characterList.push(input)
    end
  end

  def gameMenu()
    #combat, add character, test/tag skills,

  end

  def combatSim()
    

  end

  #character skill roll
  #TODO refactor
  def skillCheck(input)
    input = input.split(" ")
    character = loadCharacter(getFormatted(input[0]))
    skill = getFormatted(input[1])
    roll = input[2].to_i
    if roll == 0
      roll = D(100)
      puts "Rolled #{roll}"
    end

    levels = ["Extreme", "Hard", "Normal", "Easy"]
    success = false
    difficulty = 8
    count = 0
    while !success && (count != 4)
      if success = ((roll*2/difficulty) <= character.skills[skill])
        puts "#{levels[count]} Success!"
        character.train(skill)
        character.saveCharacter
        return true
      end
      difficulty = difficulty/2
      count++

      puts "Abject Failure!"
      return false
    end
  end

  def scenarioEnd()
  end


end
