require 'yaml'
require_relative 'character'
require_relative '../lib/dice'
require_relative '../lib/birth'
class CoCchar
	include Dice
	include Birth

	def initialize()
		@str = 0
		@con = 0
		@pow = 0
		@dex = 0
		@app = 0
		@luck = 0


		@intel = 0
		@siz = 0
		@educ =0

		@age = 0

		@dbnb =0
		@build = 0
		@damBonus = 0
		@hp =0
		@move = 7

		@sanity = 0
		@magic = 0

		@PIpoints = 0
		@stats = []

	end

	def learn()
		improvementRoll = D(100)
		if improvementRoll > @educ
			@educ += D(10)
		end
	end

	def physicallyAge(decrease)
		newStr = D(10)
		newDex = D(10)
		newCon = D(10)
		total = newCon + newDex + newStr
		@str -= (newStr * decrease / total).to_i
		@dex -= (newDex * decrease / total).to_i
		@con -= (newCon * decrease / total).to_i
	end

	def applyAge()
		# if @age < 10
		# 	@str -= D(20)
		# 	@siz -= D(20)
		# 	@educ -= 20
		# 	newLuck = roll(6, 3) * 5
		# 	if newLuck > @luck
		# 		@luck = newLuck
		# 	end
		if @age < 15
			@str -= D(10)
			@siz -= D(10)
			@educ -= 10
			newLuck = roll(6, 3) * 5
			if newLuck > @luck
				@luck = newLuck
			end
		elsif @age < 20
			ageDecrease = D(5)
			@str -= ageDecrease
			@siz -= (5 - ageDecrease)
			@educ -= 5
			newLuck = roll(6, 3) * 5
			if newLuck > @luck
				@luck = newLuck
			end
		elsif @age < 40
			self.learn()

		elsif @age < 50
			2.times do self.learn()
			end
			@app -= 5
			self.physicallyAge(5)


		elsif @age < 60
			3.times do self.learn()
			end
			@app -= 10
			self.physicallyAge(10)


		elsif @age < 70
			4.times do self.learn()
			end
			@app -= 15
			self.physicallyAge(20)

		elsif @age < 80
			4.times do self.learn()
			end
			@app -= 20
			self.physicallyAge(40)

		elsif @age < 90
			4.times do self.learn()
			end
			@app -= 25
			self.physicallyAge(80)
		end

	end

	def personality(isBTraitsEnabled)
		ideology()
		possessions()
		sigPeople()
		locations()
		traits()
		if isBTraitsEnabled
			birth()
		end
	end

	def ideology()
		pick = D(10)
		puts ""
		case pick
			#TODO randomize specifics
		when 1
			# determine higher power
			puts "Believes in and prays to higher power"
			puts "Who?: (Jesus, Vishnu, Muhammad, Haile Selasie, etc)"
		when 2
			puts "Mankind can do fine without religion"
			puts "Are you agnostic/aetheist/secularist/humanist?"
		when 3
			puts "Science has all the answers"
			puts "What is your area of interest?:"
		when 4
			puts "You believe in fate bro"
			puts "How so?: (karma, class system, superstition, etc)"
		when 5
			puts "Member of secret society"
		when 6
			puts "There is an evil in society that should be rooted out"
		when 7
			puts "The occult"
		when 8
			puts "Politics"
		when 9
			puts "Money is power"
		when 10
			puts "Campaigner/Activist"
		end
		puts ""
	end

	def sigPeople()
		pick = D(10)
		puts "Significant Person:"
		case pick
			#TODO randomize specifics
		when 1
			puts "Parent"
		when 2
			puts "Grandparent"
		when 3
			puts "Sibling"
		when 4
			puts "Child"
		when 5
			puts "Partner"
		when 6
			puts "Person who taught you highest job skill"
		when 7
			puts "Childhood Friend"
		when 8
			puts "Famous Person/idol/hero (may not have met)"
		when 9
			puts "Fellow Investigator"
		when 10
			puts "NPC"
		end

		why = D(10)
		case why
			#TODO randomize specifics
		when 1
			puts "You are indebted to them"
		when 2
			puts "They taught you something"
		when 3
			puts "They gave your life meaning"
		when 4
			puts "You wronged them and seek reconciliation"
		when 5
			puts "You shared an experience"
		when 6
			puts "You seek to prove yourself to them"
		when 7
			puts "You idolize them"
		when 8
			puts "You have a feeling of regret"
		when 9
			puts "You wish to prove yourself better than them"
		when 10
			puts "They have crossed you and you seek revenge"
		end
		puts ""
	end

	def locations()
		pick = D(10)
		puts "Meaningful location:"
		case pick
			#TODO randomize specifics
		when 1
			puts "Your seat of learning"
		when 2
			puts "Your hometown"
		when 3
			puts "The place you met your first love"
		when 4
			puts "A place for quiet contemplation"
		when 5
			puts "A place for socializing"
		when 6
			puts "A place connected with ideology/belief"
		when 7
			puts "The grave of a significant person"
		when 8
			puts "Your family home"
		when 9
			puts "The place you were happiest in life"
		when 10
			puts "Your workplace"
		end
		puts ""
	end

	def traits()
		pick = D(10)
		puts "Traits:"
		print "You are "
		case pick
			#TODO randomize specifics
		when 1
			puts "a dreamer"
		when 2
			puts "a hedonist"
		when 3
			puts "a gambler"
		when 4
			puts "a good cook"
		when 5
			puts "a ladies man/seductress"
		when 6
			puts "loyal"
		when 7
			puts "possessing of a good reputation"
		when 8
			puts "generous"
		when 9
			puts "good with Animals"
		when 10
			puts "ambitious"
		end
		looks = File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/looks.txt")
		puts "You look " + looks[rand(looks.size)]
	end

	def possessions()
		pick = D(10)
		puts "Treasured possession:"
		case pick
			#TODO randomize specifics
		when 1
			puts "Item connected with your highest skill"
		when 2
			puts "Essential item for profession"
		when 3
			puts "Memento from childhood"
		when 4
			puts "Memento from departed person"
		when 5
			puts "Something given to you by your Significant Person"
		when 6
			puts "Your collection of ____"
		when 7
			puts "Something you found but don't know what it is (you seek answers)"
		when 8
			puts "A sporting item"
		when 9
			puts "A weapon"
		when 10
			puts "A pet"
		end
		puts ""
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

	def generate()
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
		if @age > 50 and D(2) == 2
			@age /= 2
		end
		self.applyAge()

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


		@stats = [@str, @con, @pow, @dex, @app, @luck, @intel, @siz, @educ, @age, @build, @damBonus, @hp, @move, @sanity, @magic, @PIpoints]
		setBounds()

		statStrings = ["strength", "constitution", "power", "dexterity", "appearance", "luck", "intelligence", "size", "education", "age", "build", "Damage Bonus", "hp", "move", "sanity", "magic points", "personal interest points"]
		saveData = statStrings.zip @stats


		occupations = File.readlines("#{File.expand_path("..", Dir.pwd)}/lib/Occupations.txt")
		puts "Job: " + occupations[rand(occupations.size)]

		personality(true)
		puts ""

		saveData.each do | name, stat |
			puts name.to_s + ": " + stat.to_s
		end

		puts "would you like to save the character y/n?"
		response = gets.chomp
		if (response == 'y')
			puts "What do you want to name the character?"
			response = gets.chomp
			generatedCharacter = Character.new("#{response}", saveData, "null", "null")
			generatedCharacter.saveCharacter
		end

	end
end

puts "'load' or create new character?"
doLoad = gets.chomp
if doLoad = "load"
	puts "Enter character name"
	name = gets.chomp
	character = Character.new
	character.loadCharacter("#{File.expand_path(Dir.pwd)}/Characters/#{filename.delete(' ')}.yml")
else
	gen  = CoCchar.new()
	gen.generate()
end
