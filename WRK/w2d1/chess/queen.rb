require_relative 'piece'

class Queen < Piece
  include Slidable

  def symbol
    if color == :black
      "\u265B"
    else
      "\u2655"
    end
  end

  protected
  def move_dirs

  end
end
