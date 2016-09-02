require_relative 'board'
require_relative 'tile'

# note -- this is all basically good except the flagged method is breaking things!
# it would also be good to find a way to ensure you don't hit a mine on turn 1
# MAYBE I CAN FIGURE THAT OUT IN MY SPARE TIME L O L #death

class Game

  def initialize(board)
    @board = board
    @grid = board.grid
  end

  def get_guess
    puts "Enter a guess like '(r/f) 2 3'"
    guess = gets.chomp.split(" ")
    pos = [guess[1].to_i, guess[2].to_i]
    if guess[0] == 'r'
      # @grid[pos[0]][pos[1]].reveal
    else
      @grid[pos[0]][pos[1]].flagged = true
    end
    pos
  end

  def game_over?
    return true if @board.won? || @board.lost?
    false
  end

  def play
    puts "Welcome to Minesweeper!"
    puts "Good luck!"
    until @board.won?
      @board.render
      pos = get_guess
      if @board.lost?(pos)
        puts "You lost!"
        break
      end
      @board.show_neighbors(pos[0], pos[1])
    end
    puts "You won!" if @board.won?
    puts "Here was the board:"
    @board.show_all
    puts "GAME OVER"
  end

end

board = Board.new(3,1)
game = Game.new(board)
game.play
