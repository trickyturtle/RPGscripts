require 'yaml'
require_relative '../character/character'


class AutoCharGUI
  def initialize()
    Shoes.app height: 500, width: 500 do
      background rgb(240, 250, 208)
      stack margin: 10 do
        button "Auto-Create Character" do
          AutoCharGUI.new
        end
        button "Manually Create Character" do
          @time = Time.now
          @label.replace "Stop watch started at #@time"
        end
        button "Edit Character" do
          @time = Time.now
          @label.replace "Stop watch started at #@time"
        end
        button "Simulator" do
          @time = Time.now
          @label.replace "Stop watch started at #@time"
        end
        button "Stop" do
          @label.replace "Stopped, ", strong("#{Time.now - @time}"), " seconds elapsed."
        end
        @label = para "Press ", strong("start"), " to begin timing."
      end
    end
  end
end
