require_relative 'piece'

class King < Piece
  include Stepable

  def symbol
    if color == :black
      "\u265A"
    else
      "\u2654"
    end
  end

  protected
  def move_diffs

  end

end
