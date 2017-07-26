#TODO
# auto-creation
# manual creation
# saving
# Main
#
# update
# preferences - yaml

require 'yaml'
require_relative '../character/character'
require_relative '../character/createChar'

class MainMenu
  def initialize()
  end

  def initMenu()
    input = showOptions()

    while input.downcase != "exit"
      case input

      when "A"
        newCharacter = AutoCreate.new

      when "E"
        puts "What is the name of the character?\n"
        # name = gets.chomp()
        # character = Character.new()
        # character.saveCharacter
        puts "Just kidding, do this in the yaml file for now!"
        input = showOptions()

      when "M"
        newCharacter = CreateCharacter.new
        puts "\nCharacter created!\n"
        input = showOptions()

      when "G"
      else
        puts "invalid input"
        self.menu()
      end
    end
  end

  def showOptions()
    puts "What would you like to do?"
    puts "(A)uto-create Character"
    puts "(E)dit Character"
    puts "(M)anually Create Character"
    puts "(G)ame Simulator"
    puts "'exit' to quit"

    input = gets.chomp.upcase
  end

end
