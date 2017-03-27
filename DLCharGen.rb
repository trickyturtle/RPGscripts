#require "roll.rb"
require "./Deck"
class DLCharGen
  def initialize()
    #Create new Deck
    deck = Deck.new()
    deck.shuffle()

    #Get Stats Hand
    statHand = []
    12.times {statHand.push(deck.draw())}
    count = 2
    statHand.sort! { |a,b| a.weight <=> b.weight }
    for card in statHand
      if card.value != "2"
        statHand -= [card]
        count-=1
      end
      if count == 0
        break
      end
    end

    statHand.shuffle!
    puts statHand
    statString = ["Cognition", "Deftness", "Knowledge", "Mien", "Strength", "Nimbleness", "Quickness", "Smarts", "Spirit", "Vigor"]
    @stats = [@cognition, @deftness, @knowledge, @mien, @strength, @nimbleness, @quickness, @smarts, @spirit, @vigor]
    @stats.each_with_index do |item, i|

      value = statHand[i].value
      if value == "Joker"
        newCard = deck.draw()
        if newCard.value == "Joker"
          newCard = deck.draw()
        end
        suit = newCard.suit
      else
        suit = statHand[i].suit
      end
      puts "#{statString[i]}: #{level(suit)}#{traitDice(value)}"
      item = "#{level(suit)}#{traitDice(value)}"
    end



  end

  def level(suit)
    case suit
    when "Diamonds"
      return "2"
    when "Spades"
      return "4"
    when "Clubs"
      return "1"
    when "Hearts"
      return "3"
    end
  end
  def traitDice(value)
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace", "Joker"]
    values.each_with_index do |item, i|
      if value == item
        if i == 0
          return "d4"
        elsif i < 7
          return "d6"
        elsif i < 10
          return "d8"
        elsif i < 12
          return "d10"
        else
          return "d12"
        end
      end
    end
  end

end
deck = DLCharGen.new()
