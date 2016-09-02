require_relative 'p02_hashing'

class HashSet

  attr_reader :count
  attr_accessor :store
  
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count+1 > @store.length

    unless include?(key)
      self[key] << key
      @count += 1
    end

  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    val = self[key].delete(key)
    @count -= 1 if val
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    dup_ar = HashSet.new(num_buckets * 2)

    @store.each do |bucket|
      bucket.each do |el|
        dup_ar.insert(el)
      end
    end

    self.store = dup_ar.store
  end
end
