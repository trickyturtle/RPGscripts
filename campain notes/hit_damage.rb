#dodge vs fighting (def wins draw), fighting vs fighting(attack wins draw), by level of success
def initialize()
  @characterArray = {}

end

def addCharacter(char)
  @characterArray.append(char)
end

def D(sides)
  return rand(sides) + 1
end

def createCharacter()
  tempCharData = {}
  statStrings = ["strength", "constitution", "power", "dexterity", "appearance", "luck", "intelligence", "size", "education", "age", "build", "Damage Bonus", "max hp", "move", "sanity", "magic points", "current hp", "fighting skill", "dodge", "firearms"]
  for stat in statStrings
    puts "Enter #{stat}"
    statValue = gets
    tempCharData.append(statValue)
  end
  charData = statStrings.zip tempCharData
  createSave(charData)
end

def createSave(charData)
  fname = "#{character["name"]}.txt"
  file = File.open(fname, "w")
  for stat in charData
    file.puts stat
  end
  file.close
end

def saveCharacter
end

def hitLocation(damage)
  location = D(20)
  hitLocString = ""
  hitString = ""
  case location
  when 1
    hitLocString = "head"
  when 2
    "neck"
  when 3
    hitLocString = "guts"
  when 4
    hitLocString = "groin"
  when 5
    hitLocString = "chest"
  when 6
    hitLocString = "lower back"
  when 7
    hitLocString = "upper back"
  when 8
    hitLocString = "right thigh"
  when 9
    hitLocString = "left thigh"
  when 10
    hitLocString = "right hand"
  when 11
    hitLocString = "left hand"
  when 12
    hitLocString = "upper left arm"
  when 13
    hitLocString = "upper right arm"
  when 14
    hitLocString = "left forarm"
  when 15
    hitLocString = "right forarm"
  when 16
    hitLocString = "left foot"
  when 17
    hitLocString = "right foot"
  when 18
    hitLocString = "lower right leg"
  when 19
    hitLocString = "lower left leg"
  when 20
    hitLocString = "clothes"
  end

  case damage
  when 1
    hitString = "bruises your #{hitLocString}"
  when 2
    hitString = "scratches your #{hitLocString}"
  when 3
    hitString = "grazes your #{hitLocString}, drawing blood"
  when 4
    hitString = "cut/punctures/pummles your #{hitLocString}"
  when 5
    hitString = "deeply cut/punctures/concusses your #{hitLocString}"
  when 6
    hitString = "passes through/fractures your #{hitLocString}"
  when 7
    hitString = "you feel it hit the bones in your #{hitLocString}"
  when 8
    hitString = "you feel a bone in your #{hitLocString} break"
  when 9
    hitString = "shreds/shatters your #{hitLocString}"
  when 10
    hitString = "severs your #{hitLocString}"
  else
    hitString = "you think it hit an organ/artery in your #{hitLocString}"
  end
end
