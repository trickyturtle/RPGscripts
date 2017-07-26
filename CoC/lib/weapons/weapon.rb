require 'yaml'
require_relative '../fileHandler'
class Weapon
  include FileHandler
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
    for item in ["@skill", "@damage", "@DB", "@range", "@uses"]
      puts "Input #{instance_variable_get("#{item}")}"
      input = gets.chomp
      instance_variable_set("#{item}",input)
    end
    puts "How much ammo does the magazine hold?"
    @ammo = gets.chomp.to_i
    puts "What is the malfunction chance?"
    @malfunctions = gets.chomp.to_i
    weaponList = loadWeaponList()
    weaponList[@name] = self
    saveWeaponList(weaponList)
  end
end
