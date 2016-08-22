require_relative 'movement'
require_relative 'board'

class Piece

  attr_accessor :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    #@board[pos] = self
  end

  def to_s
    # puts 'this was called'
    self.symbol.force_encoding('utf-8') + ' '
  end

  def empty?

  end

  def symbol

  end

  def valid_moves

  end

  private
  def move_into_check?(to_pos)

  end

end
