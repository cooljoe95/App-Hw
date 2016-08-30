require 'byebug'
class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  def initialize
    @store = []
    @max = nil
    @min = nil
    @hash = {}
  end

  def push(el)
    @hash[el] = [@min, @max]
    if @max.nil? || el > @max
      @max = el
    end
    if @min.nil? || el < @min
      @min = el
    end
    @store.push(el)
  end

  def max
    @max
  end

  def min
    @min
  end

  def pop
    popped = @store.pop

    @max = (@hash[popped])[1]
    @min = (@hash[popped])[2]
    popped
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue

  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue(num)
    until num <= 0
      @stack2.push(@stack1.pop)
      num -= 1
    end
    until @stack2.size == 1
      @stack1.push(@stack2.pop)
    end
    @stack2.pop
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end
end

class MaxMinStackQueue

  attr_reader :max_window_range

  def initialize
    @max_window_range = nil
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def min
    @stack1.min
  end

  def max
    @stack1.max
  end

  def dequeue(num)
    until num <= 0
      # debugger
      @stack2.push(@stack1.pop)
      num -= 1
    end
    if @max_window_range.nil? || @stack2.max - @stack2.min > @max_window_range
      @max_window_range = @stack2.max - @stack2.min
    end

    until @stack2.size == 1
      @stack1.push(@stack2.pop)
    end
    @stack2.pop
    @max_window_range
  end

  def empty?
    @stack1.empty?
  end

end
