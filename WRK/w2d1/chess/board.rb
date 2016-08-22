require 'colorize'
require_relative 'rook'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'king'
require_relative 'bishop'
#require_relative 'null_piece'


class Board
  attr_accessor :grid

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
    make_starting_grid
  end

  def move(color, start_pos, end_pos)
    raise StandardError.new('Piece not found') if grid[start_pos].is_a?(NullPiece)
    # TODO: raise StandardError.new('Cannot make move')
    grid[end_pos] = grid[start_pos]
    grid[start_pos] = NullPiece.new
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[pos] = piece
  end

  def dup

  end

  def move!(start_pos, end_pos)

  end

  def checkmate?

  end

  def in_bounds?(pos)
    x, y = pos
    x.between?(0, grid.length - 1) && y.between?(0, grid.length - 1)
  end

  protected
  def make_starting_grid
    grid[0][0] = Rook.new(:black, self, [0, 0])
    grid[0][7] = Rook.new(:black, self, [0, 7])
    grid[0][1] = Knight.new(:black, self, [0, 1])
    grid[0][6] = Knight.new(:black, self, [0, 6])
    grid[0][2] = Bishop.new(:black, self, [0, 2])
    grid[0][5] = Bishop.new(:black, self, [0, 5])
    grid[0][3] = Queen.new(:black, self, [0, 3])
    grid[0][4] = King.new(:black, self, [0, 4])

    8.times do |n|
      grid[1][n] = Pawn.new(:black, self, [0, n])
    end

    grid[7][0] = Rook.new(:white, self, [7, 0])
    grid[7][7] = Rook.new(:white, self, [7, 7])
    grid[7][1] = Knight.new(:white, self, [7, 1])
    grid[7][6] = Knight.new(:white, self, [7, 6])
    grid[7][2] = Bishop.new(:white, self, [7, 2])
    grid[7][5] = Bishop.new(:white, self, [7, 5])
    grid[7][3] = Queen.new(:white, self, [7, 3])
    grid[7][4] = King.new(:white, self, [7, 4])

    8.times do |n|
      grid[6][n] = Pawn.new(:white, self, [6, n])
    end

  end



  def find_king(color)

  end

end
