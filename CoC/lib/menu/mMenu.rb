#TODO
# auto-creation
# manual creation
# saving
# Main
#
# update
# preferences - yaml

require 'yaml'
require_relative 'character'

class MainMenu
  def initialize()

  end

  def menu()
    puts "What would you like to do?"
    puts "(A)uto-create Character"
    puts "(E)dit Character"
    puts "(M)anually Create Character"
    puts "(G)ame Simulator"

    input = gets.chomp
    case input
    when "A"
    when "E"
    when "M"
    when "G"
    else
      puts "invalid input"
      self.menu()
    end
  end

end
