require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'HumanPlayer.rb'
require_relative 'ComputerPlayer.rb'

class Game

  attr_reader :board, :prev_guess

  def initialize(player)
    @board = Board.new
    @prev_guess = nil
    @player = player
  end



  def play
    until @board.won?
      @board.render
      puts "Enter a guess in the form 'x, y'"
      pos = @player.get_guess
      make_guess(pos)
    end

    system("clear")
    puts "PARTY TIME"
  end

  def make_guess(pos)
    p "#{pos} hi"
    @player.receive_revealed_card(pos, @board[pos].value)
    if prev_guess
      if @board[pos] == @board[prev_guess] && pos != prev_guess
        @board[pos].reveal
      else
        @board[pos].reveal
        @board.render
        sleep(2)
        @board[pos].hide
        @board[prev_guess].hide
        system("clear")
      end
      @prev_guess = nil
    else
      @prev_guess = pos
      @board[@prev_guess].reveal
    end
  end

end

joe = ComputerPlayer.new("Joe")
Game.new(joe).play
