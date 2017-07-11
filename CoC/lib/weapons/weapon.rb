require 'yaml'
# require_relative 'weaponRetriever'
class Weapon
  # include WeaponRetriever
  def initialize(name)
    @name = name
    @skill = "Skill (Firearms(MG), Firearms(handguns), Brawling, etc)"
    @damage = "Damage (2D4+2, 1D10, etc) (don't include Damage Bonus)"
    @DB = "Damage Bonus (DB, DB/2, 0, etc)"
    @range = "Base Range (100 yards, etc)"
    @uses = "Uses per Round (1, 2, burst(3), full auto, etc)"
    @ammo = 0
    @malfunctions = 0
  end

  def getData()
    for item in [@skill, @damage, @DB, @range, @uses]
      puts "Input #{item}"
      item = gets.chomp
    end
    puts "How much ammo does the magazine hold?"
    @ammo = gets.chomp.to_i
    puts "What is the malfunction chance?"
    @malfunctions = gets.chomp.to_i
    weaponList = YAML.load_file("#{File.expand_path(Dir.pwd)}/lib/weapons/weaponList.yml")
    weaponList[@name] = self
    File.open(File.expand_path("#{File.expand_path(Dir.pwd)}/lib/weapons/weaponList.yml"), "w") {|f| f.write(weaponList.to_yaml) }
  end


end
