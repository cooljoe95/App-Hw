require_relative 'cursor'
require_relative 'board'
require 'colorize'

class Display

  attr_accessor :cursor, :board, :cur_color

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @notifications = {}
    @cur_color = :white
    @board = board
  end

  def move(new_pos)
    # system('clear')
    loop do
      # render
      # pos = self.cursor.get_input
      cursor.selected = false
      cursor.selected_pos = nil
      until cursor.selected
        system('clear')
        p @cur_color
        render
        start_pos = self.cursor.get_input
        unless board[start_pos].color == @cur_color
          cursor.selected = false
        end
      end
      cursor.selected = false
      until cursor.selected
        system('clear')
        render
        end_pos = self.cursor.get_input
      end
      @cur_color = @cur_color == :white ? :black : :white

      board.move(@cur_color, start_pos, end_pos)
      # @cur_color = @cur_color == :white ? :black : :white
    end
  end

  def render
    final = ''
    moves = board[cursor.cursor_pos].valid_moves unless cursor.selected
    moves = board[cursor.selected_pos].valid_moves unless cursor.selected_pos.nil?
    board.grid.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        # p [i, j]
        # p cursor.cursor_pos
        if [i, j] == cursor.selected_pos
          final << (board.grid[i][j]).to_s.colorize(:background => :blue)
        elsif [i, j] == cursor.cursor_pos
          final << (board.grid[i][j]).to_s.colorize(:background => :red)
        elsif moves.include?([i,j])
          final << (board.grid[i][j]).to_s.colorize(:background => :green)
        else
          # final << board.grid[i][j].to_s

          final << (board.grid[i][j]).to_s# .colorize(:yellow) if cell.color == :black
          # final << (board.grid[i][j]).to_s.colorize(:white) if cell.color == :white
        end
      end
      final << "\n"
    end
    print final
    puts board.in_check?(:black)
  end

  private
  attr_reader :notifications


end
b = Board.new
d = Display.new(b)
d.move([0,0])
