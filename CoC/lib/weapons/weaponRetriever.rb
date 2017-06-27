require 'yaml'

module WeaponRetriever

  def retrieveWeapon(name)
    weaponList = YAML.load_file("weaponList.yml")
    puts "What is the weapon name (pistol, shotgun, etc, not its proper name Ian)"
    name = gets.chomp
    if weaponList.key?(name)
      weapon = weaponList[name]
    else
      weapon = Weapon.new(name)
      weapon.getData()
      weapon
    end
  end
end
