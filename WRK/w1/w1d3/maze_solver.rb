class MazeSolver

  def initialize(maze)
    @maze = maze
    @cur_pos = find("S")
  end

  def [](pos)
    x,y = pos
    @maze[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @maze[x][y] = value
  end

  def can_move?(pos)
    if @maze[pos] == "*" ? false : true
  end

  def find(letter)
    @maze.each_with_index do |row,x|
      row.each_with_index do |block,y|
        return [x,y] if block == letter
      end
    end
  end

  def priority
    # e_pos = find("E")
    # priority_x = e_pos[0] - @cur_pos[0]
    # priority_y = e_pos[1]
  end


  def print_maze
    p @maze
  end

end








if __FILE__ == $PROGRAM_NAME
  MazeSolver.new(File.readlines("maze2.txt").map{|line| line.chomp.chars}).print_maze

end
