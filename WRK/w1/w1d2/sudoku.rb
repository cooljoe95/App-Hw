require 'colorize'
require 'set'

class Tile

  attr_accessor :value, :given

  def initialize(value)
    if value == 0
      @given = false
      @value = 0
    else
      @given = true
      @value = value
    end
  end

  def to_s
    if given
      return @value.to_s.colorize(:black)
    elsif @value == 0
      return @value.to_s.colorize(:green)
    else
      return @value.to_s.colorize(:red)
    end
  end
end

class Board

  attr_accessor :grid

  ALL_NUMS = Set.new(1..9)

  def initialize(grid_path)
    @grid = Board.from_file(grid_path)
  end

  def self.from_file(path)
    rows = File.readlines(path).map(&:chomp)
    grid = Array.new(9) { [] }
    rows.each_with_index do |row, idx|
      row.chars.each do |num|
        grid[idx] << Tile.new(num.to_i)
      end
    end
    grid
  end

  def []=(pos, val)
    x,y = pos
    @grid[x][y].value = val
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def update_tile(pos, val)
    unless self[pos].given
      self[pos] = val
    end
  end

  def render
    @grid.each do |line|
      line.each do |char|
        print char.to_s
      end
      puts
    end
  end

  def solved?
    rows_solved? && columns_solved? && boxes_solved?
  end

  def rows_solved?
    @grid.each do |row|
      ar = []
      row.each do |tile|
        ar << tile.value
      end
      return false unless ar.to_set == ALL_NUMS
    end
    true
  end

  def columns_solved?
    columns = @grid.transpose
    columns.each do |row|
      ar = []
      row.each do |tile|
        ar << tile.value
      end
      return false unless ar.to_set == ALL_NUMS
    end
    true
  end


  def boxes_solved?
    flat_grid = @grid.flatten
    until flat_grid.length == 0
      box1, box2, box3 = [], [], []
      3.times do
        3.times {box1 << flat_grid.shift.value}
        3.times {box2 << flat_grid.shift.value}
        3.times {box3 << flat_grid.shift.value}
      end
      return false unless box1.to_set == ALL_NUMS &&
                          box2.to_set == ALL_NUMS &&
                          box3.to_set == ALL_NUMS
    end

    true
  end



end

class Game

  def initialize(board = './puzzles/sudoku1.txt')
    @board = Board.new(board)
  end

  def play
    until @board.solved?
      @board.render
      puts "enter a position/value in the form 'x y val'"
      move = gets.chomp.split(" ").map(&:to_i)
      @board.update_tile([move[0], move[1]], move[2])
    end

    system("clear")
    puts "you are a sudoku master"

    @board.render
  end





end

Game.new('./puzzles/sudoku1-almost.txt').play
