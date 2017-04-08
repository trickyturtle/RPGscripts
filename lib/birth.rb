module Birth
  def birth()
    pick = D(150)
    case pick
    when 1
      puts "Caul-veil birth"
      @luck += D(10)
    when 2
      puts "Born during eclipse"
      @luck -= D(10)
      @str += D(5)
      @con += D(5)
      @dex += D(5)
      @pow += (D(11) - 6)
    when 3
      puts "Blood Moon rose during birth"
      @pow += D(10)
    when 4
      puts "Born on Blue Moon"
      @luck += D(5)
    when 5
      puts "Fraternal Twin"
    when 6
      puts "Identical Twin"
      if D(10) == 1
        puts "...and one of you is evil"
      end
    when 7
      puts "Born under a bad sign"
      @luck -= D(10)
    when 8
      if D(10) > 3
        puts "Comet during birth"
        @pow += D(5)
      else
        puts "Twin-tailed comet during birth"
        @pow += D(10)
      end
    when 8
      puts "Meteor shower during birth"
    when 9
      puts "Born on solstice"
      @dex -= D(5)
      @pow += D(5)
    when 10
      puts "Born on equinox"
      @app += D(5)
      @pow -= D(5)
    when 11
      puts "Stars aligned during birth"
      if D(2) == 1
        puts "...and mercury was in retrograde"
        @luck -= D(5)
      else
        puts "...and Venus was rising"
        @pow += D(5)
      end
    when 12
      puts "Mother died during birth"
      @pow -= D(5)
    when 13
      puts "Mother died before birth"
      @app -= D(5)
      @pow += D(5)
      @str += D(10)
      @con += D(5)
      @intel -= D(5)
      @luck -= D(10)
    when 14
      puts "Mismatched eyes"
    when 15
      puts "Polydactyl"
      @dex += (D(11) - 6)
    when 16
      puts "No memory of past"
    when 17
      puts "Unusual birthmark"
      @app += (D(11) - 6)
    when 18
      #Thrush Song
      puts "A thrush flew over you when you were born"
      @intel += D(10)
      @pow -= D(10)
    when 19
      #Selkie kiss
      puts "You were born out at sea."
      puts "Your parents always told you a selkie kissed you and promised to keep you safe."
      @luck += D(10)
    when 20
      #Mysterious hermit
      puts "A stranger came when you were born and told your parents you were a child of the gods."
      puts "He gave them an oil he said was magic."
      puts "They assumed he was crazy but kept it as a memento"
      @pow += D(10)
    when 21
      #Grey Fox
      puts "A grey fox ate the family cat during your birth"
      @luck += (D(10) - 5)
      @intel += D(5)
    when 22
      #Oak Hollow
      puts "You had a strong bond to an oak tree as a child"
      @con += D(5)
      #if it is destroyed, lose sanity
    when 23
      puts "Born during a natural disaster"
      @pow -= D(5)
      @dex += D(5)
    when 24
      puts "Born with a full head of hair"
      @str -= D(5)
      @siz -= D(10)
    when 25
      puts "Born with a large mouth"
      @app += D(5)
    when 26
      puts "Homely as a child"
      @app += D(5)
    when 27
      puts "Was a beautiful baby"
      @app -= D(5)
      @pow += D(5)
    when 28
      puts "You were put under a bed on your 9th birthday"
      @luck -= D(5)
      @siz -= D(5)
    when 29
      "You are the third son"
      @intel += D(10)
    when 30
      puts "You are the seventh son"
      if D(7) == 7
        puts "of a seventh son"
        @pow += D(10)
        @luck -= D(10)
      else
        @pow += D(5)
        @luck -= D(5)
      end
    when 31
      puts "Killed your father"
    when 32
      puts "Killed your mother"
    when 33
      puts "Killed your parents"
    end
  end
end
