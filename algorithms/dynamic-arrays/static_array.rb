# This class just dumbs down a regular store to be staticly sized.
class StaticArray

  attr_reader :length

  def initialize(length)
    @length = length
    self.store = Array.new(self.length)
  end

  # O(1)
  def [](index)
    return nil if index < 0 || index > self.length
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    return if index < 0 || index > self.length
    self.store[index] = value
  end

  protected
  attr_accessor :store
end
