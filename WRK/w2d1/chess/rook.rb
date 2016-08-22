require_relative 'piece'

class Rook < Piece
  include Slidable

  def symbol
    if color == :black
      "\u265C"
    else
      "\u2656"
    end
  end

  protected
  def move_dirs

  end
end
