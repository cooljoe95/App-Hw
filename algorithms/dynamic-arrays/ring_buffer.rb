require_relative "static_array"
require 'byebug'

class RingBuffer
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
    self.start_idx = 0
  end

  # O(1)
  def [](index)
    return nil if index < -self.length
    raise 'index out of bounds' if index >= self.length
    if index < 0
      index = self.length + index
    end
    index = (self.start_idx + index) % self.capacity
    self.store[index]
  end

  # O(1)
  def []=(index, val)
    throw IndexError if index < -self.length
    if index < 0
      index = self.length + index
    elsif index > self.capacity
      while index > self.capacity
        resize!
      end
    end
    new_index = (self.start_idx + index) % self.capacity
    self.length = index + 1 if index + 1 > self.length
    self.store[new_index] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if self.length == 0
    self.length -= 1
    index = (self.start_idx + self.length) % self.capacity
    self.store[index]
  end

  # O(1) ammortized
  def push(val)
    if self.length == self.capacity
      resize!
    end
    index = (self.start_idx + self.length) % self.capacity
    self.length += 1
    self.store[index] = val
  end

  # O(1)
  def shift
    raise 'index out of bounds' if self.length == 0
    self.length -= 1
    tmp = self.store[self.start_idx]
    self.start_idx = (self.start_idx + 1) % self.capacity
    tmp
  end

  # O(1) ammortized
  def unshift(val)
    if self.length == self.capacity
      resize!
    end
    self.start_idx = (self.start_idx - 1) % self.capacity
    self.length += 1
    self.store[start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    tmp_array = StaticArray.new(self.capacity *= 2)
    (self.start_idx...self.capacity).each do |el|
      tmp_array[el - self.start_idx] = self.store[el]
    end
    (0...self.start_idx).each do |el|
      tmp_array[el + self.start_idx] = self.store[el]
    end
    self.start_idx = 0
    self.store = tmp_array
  end
end
