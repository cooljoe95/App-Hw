require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    list_of_cards = []
    suits = Card::SUIT_STRINGS.keys
    values = Card::VALUE_STRINGS.keys

    (0...52).each do |i|
      suit = suits[i%4]
      value = values[i%13]
      list_of_cards << Card.new(suit, value)
    end

    list_of_cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.length
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > @cards.length
    result = @cards[0...n]
    @cards = @cards[n..-1]
    result
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards.concat(cards)
  end
end
