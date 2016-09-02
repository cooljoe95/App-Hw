require_relative 'tile'
require 'colorize'

class Board

  attr_accessor :grid

  def initialize(size = 9, bombs = 10)
    @grid = Array.new(size) do
      Array.new(size) { Tile.new(0) }
    end
    populate(bombs)
  end

  def show_all
    @grid.each do |row|
      final = ""
      row.each do |tile|
        if tile.bomb
          final << "! ".colorize(:red)
        elsif tile.bombs_nearby == 0
          final << "_ "
        else
          final << tile.bombs_nearby.to_s.colorize(:blue) + " "
        end
      end
      puts final
    end
  end

  def render
    @grid.each do |row|
      final = ""
      row.each do |tile|
        if tile.guessed == false
          final << "? ".colorize(:grey)
        elsif tile.flagged
          final << "! ".colorize(:red)
        elsif tile.bombs_nearby == 0
          final << "  "
        else
          final << tile.bombs_nearby.to_s.colorize(:blue) + " "
        end
      end
      puts final
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x, y = pos
    grid[x][y] = value
  end

  def populate(num)
    size = @grid[0].length
    bombs = 0
    until bombs == num
      x = rand(size)
      y = rand(size)
      tile = @grid[x][y]

      unless tile.bomb
        tile.bomb = true
        bombs += 1
        populate_neighbors(x,y)
      end
    end

  end

  def won?
    @grid.each do |line|
      line.each do |tile|
        return false unless tile.guessed || tile.bomb
      end
    end
    true
  end

  def lost?(pos)
    x,y = pos
    return true if @grid[x][y].bomb
    false
  end

  def show_neighbors(x, y)
    size = @grid[0].length
    current_tile = @grid[x][y]
    return if current_tile.bomb
    return if x < 0 || x >= size
    return if y < 0 || y >= size
    return if current_tile.guessed
    current_tile.reveal
    return if current_tile.bombs_nearby > 0
    (-1..1).each do |idx1|
      (-1..1).each do |idx2|

        next if x + idx1 >= size || y + idx2 >= size
        next if x + idx1 < 0 || y + idx2 < 0
        next if idx1 == 0 && idx2 == 0

        neighbor = @grid[x + idx1][y + idx2]
        next if neighbor.bomb
        show_neighbors(x + idx1, y + idx2)

      end
    end
  end

  def populate_neighbors(x,y)
    size = @grid[0].length
    (-1..1).each do |idx1|
      (-1..1).each do |idx2|

        next if x + idx1 >= size || y + idx2 >= size
        next if x + idx1 < 0 || y + idx2 < 0
        next if idx1 == 0 && idx2 == 0

        neighbor = @grid[x + idx1][y + idx2]
        neighbor.bombs_nearby += 1

      end
    end
  end

end
