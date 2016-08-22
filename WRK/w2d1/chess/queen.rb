require_relative 'piece'

class Queen < SlidingPiece
  # include Slidable

  def symbol
    if color == :black
      "\u265B"
    else
      "\u2655"
    end
  end

  protected
  def move_dirs
    moves = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]


  end
end
