require_relative 'piece'

class Pawn < Piece

  def symbol
    if color == :black
      "\u265F"
    else
      "\u2659"
    end
  end

  def moves

  end

  protected

  def at_start_row?
  end

  def forward_dir

  end

  def forward_steps

  end

  def side_attacks

  end
end
