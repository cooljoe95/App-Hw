require 'byebug'

class ComputerPlayer

  attr_reader :next_guess, :possibilities

  def initialize(name)
    @known_cards = {}
    @matched_cards = []
    @next_guess = nil
    @possibilities = []
    @name = name

    populate_poss
  end

  def populate_poss
    (0...3).each do |i|
      (0...4).each do |j|
        @possibilities << [i, j]
      end
    end
  end

  def receive_revealed_card(pos, val)

    if @known_cards[val] == nil
      @known_cards[val] = pos
    else
      @known_cards[val] += pos unless @known_cards[val].include?(pos)
    end
    #@known_cards[pos] = val
  end

  def receive_match(pos_1, pos_2)
    @matched_cards << pos_1
    @matched_cards << pos_2
  end

  def get_guess
    if @next_guess
      return_val = @next_guess
      @next_guess = nil
      receive_match(@prev_match, return_val)
      return return_val
    end
    @known_cards.each do |key, value|
      if value.length >= 2
        @prev_match = value[1]
        @next_guess = value[0]
        return value[1]
      end
    end
    # if @known_cards.any? { |k, v| @known_cards.values.count(x) == 2}
    #   paired = @known_cards.select { |k, v| @known_cards.values.count(x) == 2}
    #
    #
    # else
    @possibilities = @possibilities - @matched_cards
    # end
    #
    #
    #
    # x = @possibilities.sample
    #
    p @possibilities
    # p x
    p @matched_cards
    p @known_cards

    @possibilities.sample



  end


end
