require 'yaml'
class Formatter
#this was made to deal with formatting from names taken from book.  was originally in lib

  def spaces(filename)
    stats = {}
    lines = File.readlines("#{Dir.pwd}/CoC/lib/#{filename}")
    lines.each do |line|
      skill = line.split("_")
      puts skill
      stats[skill[0]] = skill[1].to_i
      puts stats
    end
    File.open(File.expand_path("Skills.yml"), "w") {|f| f.write(stats.to_yaml) }
  end

  def nums(filename)
    males = []
    females = []
    surnames = []
    filestuff = IO.read("#{Dir.pwd}/#{filename}")
    filearray = filestuff.split(/[\n\r]/)
    #filearray = filestuff.split("\n")

    filearray.each_with_index do |name,index|
      if is_i(name)
        males.push(filearray[index+1])
        females.push(filearray[index+2])
        surnames.push(filearray[index+3])
        index +=1
      end
    end
    dumpstring(males)
    puts
    dumpstring(females)
    puts
    dumpstring(surnames)

  end

  def dumpstring(arr)
    for entry in arr
      puts entry
    end
  end


  def is_i(thing)
       /\A[-+]?\d+\z/ === thing
  end
end



# form = Formatter.new
# puts Dir.pwd
# puts "space or nums?"
# choice = gets.chomp
# puts "name?"
# filename = gets.chomp
# if choice == "s"
#   form.spaces(filename)
# else
#   form.nums(filename)
# end
form = Formatter.new
form.spaces("SkillsTemp.txt")
