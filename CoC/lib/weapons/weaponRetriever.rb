require 'yaml'
require_relative 'weapon'
require_relative '../fileHandler'

module WeaponRetriever
  include FileHandler

  def retrieveWeapon(name)
    #Capitalize all letters
    name = name.split.map(&:capitalize).join(' ')
    weaponList = loadWeaponList()
    if weaponList.key?(name)
      weapon = weaponList[name]
    else
      weapon = Weapon.new(name.capitalize)
      weapon.getData()
      weapon
    end
  end
end
