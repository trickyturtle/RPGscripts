require 'yaml'
class Weapon
  def initialize(name)
    @name = name
    @skill = "Skill (Firearms(MG), Firearms(handguns), Brawling, etc)"
    @damage = "Damage (2D4+2, 1D10, etc)"
    @range = "Base Range (100 yards, etc)"
    @uses = "Uses per Round (1, 2, burst(3), full auto, etc)"
    @ammo = 0
    @malfunctions = 0
  end

  def getsData()
    for item in [@skill, @damage, @range, @uses]
      puts "Input #{item}"
      item = gets.chomp
    end
    puts "How much ammo does the magazine hold?"
    @ammo = gets.chomp.to_i
    puts "What is the malfunction chance?"
    @malfunctions = gets.chomp.to_i
    weaponList = YAML.load_file("weaponList.yml")
    weaponList[@name] = self
    File.open(File.expand_path("weaponList.yml"), "w") {|f| f.write(weaponList.to_yaml) }
  end


end
