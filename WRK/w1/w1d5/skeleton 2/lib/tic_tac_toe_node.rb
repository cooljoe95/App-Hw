require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :next_mover_mark
  attr_reader :board, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @parent = nil
  end

  def losing_node?(evaluator)

    return false if @board.over? && (@board.winner == evaluator || @board.winner == nil)
    return true if @board.over? && (@board.winner != evaluator)
    children = self.children
    return true if children.all? { |child| child.losing_node?(evaluator) }
    return true if children.any? { |child| child.losing_node?(evaluator) }
    false
  end

  def winning_node?(evaluator)
    return true if @board.over? && (@board.winner == evaluator)
    return false if @board.over? && (@board.winner != evaluator || @board.winner == nil)
    children = self.children
    return true if children.any? {|child| child.winning_node?(evaluator)}
  #  return true if children.all? {|child| child.winning_node?(evaluator)}
    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    results = []
    @board.rows.each_with_index do |row, x|
      row.each_index do |y|
        if @board.empty?([x,y])
          cp_board = @board.rows.deep_dup
          cp_board[x][y] = @next_mover_mark
          new_board = Board.new(cp_board)
          switch = change_mark(next_mover_mark)
          moves = [x, y]
          @prev_move_pos = moves
          new_node = TicTacToeNode.new(new_board, switch, moves)
          results << new_node
        end
      end
    end

    results

  end

  def change_mark(mark)
    if mark == :x
      mark = :o
    else
      mark = :x
    end
  end

end

class Array
  def deep_dup
    return [] if self.length == 0
    if not self[0].is_a?(Array)
      [self.first] + self[1..-1].deep_dup
    else
      [self.first.deep_dup] + self[1..-1].deep_dup
    end
  end
end


  node = TicTacToeNode.new(Board.new, :x)
  node.board[[0, 0]] = :o
  node.board[[2, 2]] = :o
  node.board[[0, 2]] = :o
  puts node.losing_node?(:x)
