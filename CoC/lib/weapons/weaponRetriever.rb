require 'yaml'
require_relative 'weapon'
module WeaponRetriever

  def retrieveWeapon(name)
    weaponList = YAML.load_file("#{File.expand_path(Dir.pwd)}/lib/weapons/weaponList.yml")
    if weaponList.key?(name)
      weapon = weaponList[name]
    else
      weapon = Weapon.new(name)
      weapon.getData()
      weapon
    end
  end
end
