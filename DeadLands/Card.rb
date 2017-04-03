class Card
  attr_reader :value, :suit, :weight
  def initialize(value, suit)
    @suit = suit
    @value = value
    @weight = 0.0
    weightCard()

  end

  def weightCard()
    #@weight = ((convertToDice(@value)/2.0 + 0.5) * toLevel(@suit))
    @weight = convertToDice(@value)*10 + toLevel(@suit)
  end

  def toLevel(suit)
    case suit
    when "Diamonds"
      return 2.0
    when "Spades"
      return 4.0
    when "Clubs"
      return 1.0
    when "Hearts"
      return 3.0
    end
    return 10.0
  end

  def convertToDice(value)
    result = 15.0
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    values.each_with_index do |item, i|
      if value == item
        if i == 0
          result =  4.0
        elsif i < 7
          result = 6.0
        elsif i < 10
          result = 8.0
        elsif i < 12
          result = 10.0
        else
          result = 12.0
        end
      end
    end
    result
  end

  def to_s
    puts "#{value} of #{suit}"
  end

end
