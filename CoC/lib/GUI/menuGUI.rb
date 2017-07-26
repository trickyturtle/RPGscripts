require 'yaml'
require_relative '../character/character'
require_relative '../character/createChar'
require_relative 'autoCharGUI'


class MenuGUI
  def initialize()
    Shoes.app height: 500, width: 500 do
      background rgb(240, 250, 208)
      stack margin: 10 do
        button "Auto-Create Character" do
          AutoCharGUI.new
        end
        button "Manually Create Character" do
          CreateCharGUI.new
        end
        button "Edit Character" do
          EditCharGUI.new
        end
        button "Simulator" do
          SimulatorGUI.new
        end
      end
    end
  end
end

MenuGUI.new
