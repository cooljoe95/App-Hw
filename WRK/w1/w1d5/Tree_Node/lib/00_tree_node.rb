class PolyTreeNode

  attr_reader :parent, :value, :children

  def initialize(value)
    @parent = nil
    @value = value
    @children = []
  end

  def parent=(parent_node)

    unless parent.nil?
      parent.children.delete(self)
    end
    @parent = parent_node
    parent_node.children << self unless parent_node.nil? || parent_node.children.include?(self)
  end

  def add_child(child_node)
    children << child_node
    child_node.parent = self
  end

  def remove_child(child)
    raise "Let's go on Maury, cause that is not my kid" unless children.include?(child)
    children.delete(child)
    child.parent = nil
  end

  def dfs(target_val)
    if value == target_val
      return self
    end
    children.each do |child|
      subtree = child.dfs(target_val)
      return subtree unless subtree.nil?
    end
    nil
  end


  def bfs(target_val)
    q = [self]
    until q.empty?
      node = q.pop
      if node.value == target_val
        return node
      end

      node.children.each do |child|
        q.insert(0, child)
      end
    end
    nil
  end

  def to_s
    " #{self.value} "
  end
end
