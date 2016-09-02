class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  include Enumerable

  attr_reader :count, :store

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if i.abs >= @store.length
    (i = (i % count)) if i < 0
    @store[i]
  end

  def []=(i, val)
    i = i % count if i < 0
    return nil if i >= @store.length
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    (0...capacity).each do |i|
      return true if @store[i] == val
    end
    false
  end

  def push(val)
    if @count == capacity
      resize!
    end
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    if @count >= capacity
      resize!
    end
    (0...@count).each do |i|
      @store[@count - i] = @store[@count - i - 1]
    end
    @count += 1
    @store[0] = val
  end

  def pop
    return nil if count == 0
    @count -= 1
    return_val = @store[@count]
    @store[@count] = nil
    return_val
  end

  def shift
    return nil if count == 0
    return_val = @store[0]
    (0...@count).each do |i|
      @store[i] = @store[i + 1]
    end
    @count -= 1
    return_val
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each(&prc)
    (0...@count).each { |i| prc.call(@store[i])}
    @store
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
    return false if other.count != self.count
    (0...@count).each do |i|
      return false if @store[i] != other[i]
    end
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_ar = DynamicArray.new (capacity * 2)
    self.each_with_index do |el, i|
      new_ar[i] = el
    end
    @store = new_ar.store
  end
end
