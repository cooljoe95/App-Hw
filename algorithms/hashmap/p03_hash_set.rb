require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if include?(key)
    @count += 1
    self[key.hash] << key
    resize! if @count >= @store.length
  end

  def remove(key)
    @count -= 1 if self[key.hash].delete(key)
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev = @store
    @store = Array.new(prev.length * 2) { Array.new }
    prev.each do |bucket|
      bucket.each do |el|
        self[el.hash] << el
      end
    end
  end
end
