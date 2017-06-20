class Occupation
  def initialize()
    puts "Enter Occupation name:"
    @name = gets.chomp
    @modifier = []
    puts ""
    input = ""
    while input != "no"
      puts "Enter Occupation Skill Points Stat Multiplier"
      puts "ex: 'Strength 2'"
      @modifier << gets.chomp.split(" ")
      puts "Another? ('no' to stop)"
      input = gets.chomp
      puts ""
    end
  end
end
