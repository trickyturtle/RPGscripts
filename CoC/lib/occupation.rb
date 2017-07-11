class Occupation

  attr_accessor :modifier

  def initialize()
    #if job calls for 'or' skills (ie strenght or dex) put both
    @modifier = []
    input = ""
    puts "\nEnter Occupation Skill Points Stat Multiplier"
    puts "ex: 'Strength 2'"
    puts "put 'Strength 2 Dexterity 2' for 'or' skills"
    input = gets.chomp

    while input != "no"
      @modifier << input.split(" ")
      puts "Another? ('no' to stop)"
      input = gets.chomp
    end
  end
end
