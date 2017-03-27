require "./Card"
class Deck
  # @suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
  # @values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  # @jokers = ["BJ", "RJ"]

  def initialize()
    @suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    @values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    @jokers = [Card.new("Joker", "Black"), Card.new("Joker", "Red")]
    @deck = []
    for suit in @suits
      for value in @values
        @deck.push(Card.new(value, suit))
      end
    end
    for joker in @jokers
      @deck.push(joker)
    end
  end

  def shuffle()
    @deck.shuffle!
  end

  def printDeck()
    for card in @deck
      puts card
    end
  end

  def draw()
    @deck.pop
  end

end
