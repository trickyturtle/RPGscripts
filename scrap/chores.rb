require 'yaml'
class Chores
  def initialize()
    @choreHash = {}
    @choreList = ["trash", "recycling", "sweep", "mop", "unloaddishes", "loadDishes", "litterABOX", "WipeCounters", "sharedLaundry", "guestBath", "MowYard", "Vacuum", "OrganizeMainArea", "DavidBath"]
    @daList=[]
    @cnList =[]
    @daTot = 0
    @cnTot = 0
    tempChores = YAML.load_file("chores.yml")
    @choreHash = tempChores.choreHash
    # for chore in @choreList
    #   puts chore
    #   puts "DA"
    #   da = gets.chomp.to_i
    #   puts "nais"
    #   nais = gets.chomp.to_i
    #   @choreHash[chore] = [da, nais]
    # end
    # File.open(File.expand_path("chores.yml"), "w") {|f| f.write(self.to_yaml) }
  end

  def choreHash()
    @choreHash
  end

  def findMaxDiff()
    max = 1
    last = ""
    while @choreHash.size != 0
      max = 0
      choreName = ""
      daMax = 0
      cnMax = 0
      for chore in @choreHash
        da = chore[1][0]
        cn = chore[1][1]
        #if ((da >= cn) && last != "c") || ((da <= cn) && last != "d")
          #puts "here"
          if ((da - cn).abs >= max)
            max = (da - cn).abs
            choreName = chore[0]
            daMax = da
            cnMax = cn
          #end
        end
      end
      puts "max: #{max}"
      if daMax > cnMax
        @cnTot += cnMax
        @cnList << (choreName)
      elsif daMax != cnMax
        @daTot += daMax
        @daList << (choreName)
      elsif @daTot > @cnTot
        @cnTot += cnMax
        @cnList << (choreName)
      else
        @daTot += daMax
        @daList << (choreName)
      end
      @choreHash.delete(choreName)
      puts "size: #{@choreHash.size}"
      puts choreName
    end
    puts "nais"
    puts @cnTot
    puts @cnList
    puts "D"
    puts @daTot
    puts @daList
  end
end

chores = Chores.new
chores.findMaxDiff()
