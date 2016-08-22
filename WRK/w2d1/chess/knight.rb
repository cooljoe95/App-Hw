require_relative 'piece'

class Knight < Piece
  include Stepable

  def symbol
    if color == :black
      "\u265E"
    else
      "\u2658"
    end
  end

  protected
  def move_diffs

  end

end
