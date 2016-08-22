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

  def moves

  end

  private
  def move_into_check?(to_pos)

  end

end

class SlidingPiece < Piece
  def moves
    available_dirs = self.move_dirs
    final_locs = []
    available_dirs.each do |dir|
      dx, dy = dir
      x, y = self.pos
      x += dx
      y += dy
      while board.in_bounds?([x, y]) &&
          (board.grid[x][y].is_a?(NullPiece) || board.grid[x][y].color != self.color)
        final_locs << [x, y]
        x += dx
        y += dy
      end
      final_loc = [x, y]
    end
    final_locs
  end
end

class SteppingPiece < Piece
  def moves
    available_locs = self.move_diffs
    final_locs = []
    available_locs.each do |dx, dy|
      x, y = self.pos[0] + dx, self.pos[1] + dy
      final_locs << [x, y] if board.in_bounds?([x, y]) &&
                (board.grid[x][y].is_a?(NullPiece) || board.grid[x][y].color != self.color)
    end
    final_locs
  end
end
