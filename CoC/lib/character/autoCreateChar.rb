require 'yaml'
require_relative 'character'
require_relative '../lib/dice'
require_relative '../lib/birth'
module AutoCreate
	include Dice
	include Birth

  def create()
    @character = Character.new
    genStats()
    setBounds()
    derivedStats()
  end

  def genStats()
    #3d6*5
		@str = roll(6, 3) * 5
		@con = roll(6, 3) * 5
		@pow = roll(6, 3) * 5
		@dex = roll(6, 3) * 5
		@app = roll(6, 3) * 5
		@luck = roll(6, 3) * 5

		#2d6+6*5
		@intel = (roll(6, 2) + 6) * 5
		@siz = (roll(6, 2) + 6) * 5
		@educ = (roll(6, 2) + 6) * 5

		@age = D(83)+7
		if @age > 44 and D(2) == 2
			@age /= 2
		end
    if @age < 16 and D(2) == 2
      @age *= 2
    end
    character.applyAge
  end


  def derivedStats()
		@dbnb = @str + @siz

		if @dbnb <= 64
			@build = -2
			@damBonus = "-2"
		elsif @dbnb <= 84
			@build = -1
			@damBonus = "-1"
		elsif @dbnb <= 124
			@build = 0
			@damBonus = "None"
		elsif @dbnb <= 164
			@build = 1
			@damBonus = "+D4"
		elsif @dbnb <= 204
			@build = 2
			@damBonus = "+D6"
		else
			puts "build/damBonus error"
		end

		@hp = (@con + @siz)/10

		if(@dex > @siz )
			@move += 1
		end
		if(@str > @siz )
			@move += 1
		end


		@sanity = @pow
		@magic = (@pow/5)
		@PIpoints = @intel * 2
  end

	def setMin()
		for @stat in @stats
			if @stat.class == String
				#do nothing
			elsif @stat < 1
				@stat = 1
			end
		end
	end

	def setMax()
		for @stat in @stats
			if @stat.class == String
				#do nothing
			elsif @stat > 99
				@stat = 99
			end
		end
	end

	def setBounds()
		setMin()
		setMax()
	end

	#TODO add backstory, do something with the stuff below

		occupations = File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/Occupations.txt")
		puts "Job: " + occupations[rand(occupations.size)]

		personality(true)
		puts ""

		saveData.each do | name, stat |
			puts name.to_s + ": " + stat.to_s
		end

		puts "would you like to save the character y/n?"
		#TODO Joe, gets just waits for user input (in the console, which is why this won't run in atom anymore) and then stores it in the variable. .chomp removes trailing whitespace or newlines
		response = gets.chomp
		if (response == 'y')
			puts "What do you want to name the character?"
			response = gets.chomp
			#TODO Joe, Character.new is creating a new character object. .new will always call the initialize() fuction for that class. You can go look at character.rb's initialize class to see what it's doing.
			generatedCharacter = Character.new("#{response}", saveData, "null", "null")
			generatedCharacter.saveCharacter
		end

	end
end

end
