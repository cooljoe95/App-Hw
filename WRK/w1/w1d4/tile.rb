class Tile

  attr_accessor :bomb, :color, :guessed, :bombs_nearby, :flag, :flagged

  def initialize(num)
    @bomb = false
    @color = "green"
    @guessed = false
    @bombs_nearby = 0
    @flag = false
  end

  def reveal
    @guessed = true
  end

  def flag
    @flagged = true
  end


end
