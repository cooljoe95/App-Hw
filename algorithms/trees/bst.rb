class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    @root = self.class.insert!(@root, value)
  end

  def find(value)
    self.class.find!(@root, value)
  end

  def inorder
    self.class.inorder!(@root)
  end

  def postorder
    self.class.postorder!(@root)
  end

  def preorder
    self.class.preorder!(@root)
  end

  def height
    self.class.height!(@root)
  end

  def min
    self.class.min(@root)
  end

  def max
    self.class.max(@root)
  end

  def delete(value)
    @root = self.class.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node
    if(value <= node.value)
      node.left = self.insert!(node.left, value)
    else
      node.right = self.insert!(node.right, value)
    end
    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value
    return self.find!(node.right, value) if value > node.value
    self.find!(node.left, value)
  end

  def self.preorder!(node)
    return [] unless node
    final = [node.value]
    final = final + self.preorder!(node.left)
    final = final + self.preorder!(node.right)
  end

  def self.inorder!(node)
    return [] unless node
    left = self.inorder!(node.left)
    left << node.value
    left = left + self.inorder!(node.right)
  end

  def self.postorder!(node)
    return [] unless node
    left = self.postorder!(node.left)
    left = left + self.postorder!(node.right)
    left << node.value
  end

  def self.height!(node)
    return -1 unless node
    left_height = self.height!(node.left)
    right_height = self.height!(node.right)
    max = left_height > right_height ? left_height : right_height
    max += 1
  end

  def self.max(node)
    return nil unless node
    return node unless node.right
    self.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node unless node.left
    self.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left
    node.left = self.delete_min!(node.left)
  end

  def self.get_parent!(node, value)
    return nil unless node || node.value == value
    return node if node.left == value || node.right == value
    return self.get_parent!(node.right, value) if value > node.right
    self.get_parent!(node.left, value)
  end

  def self.delete!(node, value)
    return nil unless node
    if node.value == value
      min_node = self.min(node.right)
      node = self.delete_min!(node.right)
      min_node.left = node.left if node
      min_node.right = node.right if node
      return node ? min_node : nil
    end
    return node.right = self.delete!(node.right, value) if value > node.value
    node.left = self.delete!(node.left, value)
  end
end
