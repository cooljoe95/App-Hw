require_relative 'cursor'
require_relative 'board'
require 'colorize'

class Display

  attr_accessor :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @notifications = {}
    @board = board
  end

  def move(new_pos)
    # system('clear')
    loop do
      render
      j = self.cursor.get_input
      system('clear')
      # render
    end
  end

  def render
    final = ''
    board.grid.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        # p [i, j]
        # p cursor.cursor_pos
        if [i, j] == cursor.cursor_pos

          final << (board.grid[i][j]).to_s.colorize(:background => :red)
        else
          # final << board.grid[i][j].to_s
          final << (board.grid[i][j]).to_s
        end
      end
      final << "\n"
    end
    print final
  end

  private
  attr_reader :notifications


end
b = Board.new
d = Display.new(b)
d.move([0,0])
