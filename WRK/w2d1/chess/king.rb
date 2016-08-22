require_relative 'piece'

class King < SteppingPiece
  # include Stepable

  def symbol
    if color == :black
      "\u265A"
    else
      "\u2654"
    end
  end

  protected
  def move_diffs
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
