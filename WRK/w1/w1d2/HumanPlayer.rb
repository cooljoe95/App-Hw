class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_guess
    guess = gets.chomp
    guess = guess.split(", ")
    pos_x = guess[0].to_i
    pos_y = guess[1].to_i
    [pos_x, pos_y]
  end

  def receive_revealed_card(pos, val)
  end


end
