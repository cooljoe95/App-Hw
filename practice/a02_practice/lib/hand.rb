class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    aces = @cards.select { |card| card.value == :ace}
    non_aces = @cards - aces
    @cards = non_aces + aces
    @cards.each_with_index do |card|
      if card.value == :ace && sum + 11 <= 21 && card == @cards.last
        sum += 11
      elsif card.value == :ace
        sum += 1
      else
        sum += card.blackjack_value
      end
    end
    sum
  end

  def busted?
    points > 21
  end

  def hit(deck)
    if busted?
      raise "already busted"
    end
    @cards.concat(deck.take(1))
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted? ||other_hand.points < points
    false
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
