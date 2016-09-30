require_relative "PolyTreeNode"

class KnightPathFinder

  SIZE = 8

  attr_reader :visited_positions, :start_pos, :move_tree

  def initialize(start_pos)
    raise_error(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
    @move_tree = build_move_tree
  end

  def self.valid_moves(pos)
    x, y = pos

    results = []

    (-2..2).each do |dx|
      (-2..2).each do |dy|

        next if x + dx < 0 || y + dy < 0
        next if x + dx >= SIZE || y + dy >= SIZE

        if dx.abs + dy.abs == 3
          loc = [x + dx, y + dy]
          results << loc unless results.include?(loc)
        end
      end
    end
    results
  end

  def new_move_positions(pos)
    new_pos = []
    valid = KnightPathFinder.valid_moves(pos)
    valid.each do |position|
      new_pos << position unless visited_positions.include?(position)
      visited_positions << position unless visited_positions.include?(position)
    end
    new_pos
  end

  def build_move_tree
    root = PolyTreeNode.new(start_pos)
    count = 0
    q = [root]
    until q.empty?
      node = q.pop
      new_moves = new_move_positions(node.value)
      new_moves.each do |child|
        count += 1
        new_node = PolyTreeNode.new(child)
        node.add_child(new_node)
        q.insert(0, new_node)
      end
    end
    root
  end

  def trace_path_back(found_node)
    results = []
    cpy = found_node
    until cpy.parent.nil?
      results.insert(0, cpy.value)
      cpy = cpy.parent
    end
    results.insert(0, start_pos)
  end

  def raise_error(pos)
    raise "Invalid position" if pos[0] < 0 || pos[0] >= SIZE
    raise "Invalid position" if pos[1] < 0 || pos[1] >= SIZE
  end

  def find_path(end_pos)
    raise_error(end_pos)
    found_node = move_tree.bfs(end_pos)
    trace_path_back(found_node)
  end

end
