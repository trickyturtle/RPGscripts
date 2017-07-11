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
    puts "What would you like to do?"
    puts "(A)uto-create Character"
    puts "(E)dit Character"
    puts "(M)anually Create Character"
    puts "(G)ame Simulator"

    input = gets.chomp.upcase
    case input
    when "A"
      newCharacter = AutoCreate.new
    when "E"
      puts "What is the name of the character?\n"
      name = gets.chomp()
      character = Character.new()
      character.saveCharacter
    when "M"
      newCharacter = CreateCharacter.new
    when "G"
    else
      puts "invalid input"
      self.menu()
    end
  end

end
