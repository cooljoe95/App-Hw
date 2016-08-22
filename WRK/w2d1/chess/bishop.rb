require_relative 'piece'

class Bishop < Piece
  include Slidable

  def symbol
    if color == :black
      "\u265D"
    else
      "\u2657"
    end
  end

  protected
  def move_dirs

  end
end
