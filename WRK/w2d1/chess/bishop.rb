require_relative 'piece'

class Bishop < SlidingPiece
  # include Slidable

  def symbol
    if color == :black
      "\u265D"
    else
      "\u2657"
    end
  end

  protected
  def move_dirs
    moves = [
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end
end
