require_relative 'piece'

class Knight < SteppingPiece

  def symbol
    if color == :black
      "\u265E"
    else
      "\u2658"
    end
  end

  protected
  def move_diffs
    moves = [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, 2],
      [1, -2],
      [2, 1],
      [2, -1]
    ]
  end

end
