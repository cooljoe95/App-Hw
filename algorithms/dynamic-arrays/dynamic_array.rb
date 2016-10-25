require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
  end

  # O(1)
  def [](index)
    return nil if index < -self.length
    raise 'index out of bounds' if index >= self.length
    if index < 0
      index = self.capacity + index
    end
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    throw IndexError if index < -self.capacity
    if index < 0
      index = self.capacity + index
    elsif index > self.capacity
      while index > self.capacity
        resize!
      end
    end
    self.length = index + 1 if index + 1 > self.length
    self.store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if self.length == 0
    self.length -= 1
    self.store[self.length]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if self.length == self.capacity
      resize!
    end
    self.length += 1
    self.store[self.length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if self.length == 0
    self.length -= 1
    tmp = self.store[0]
    (1..self.length).each do |num|
      self.store[num - 1] = self.store[num]
    end
    tmp
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if self.length == self.capacity
      resize!
    end
    self.length.downto(1) do |num|
      self.store[num] = self.store[num - 1]
    end
    self.length += 1
    self.store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    tmp_array = StaticArray.new(self.capacity *= 2)
    (0..self.length).each do |el|
      tmp_array[el] = self.store[el]
    end
    self.store = tmp_array
  end
end
