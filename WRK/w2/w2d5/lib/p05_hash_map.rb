require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    # @all_of_them = LinkedList.new
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    # @all_of_them.insert(key, val)
    resize! if @count >= @store.length
    @count += 1 unless include?(key)
    bucket(key).insert(key, val)
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    # @all_of_them.remove(key)
    @count -= 1 if include?(key)
    bucket(key).remove(key)
  end

  def each(&prc)
    @store.each do |list|
      list.each do |link|
        prc.call(link.key, link.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_hash_map = HashMap.new(num_buckets * 2)
    self.each do |k, v|
      new_hash_map.set(k, v)
    end
    self.store = new_hash_map.store
  end

  def bucket(key)
    @store[key.hash % @store.length]
    # optional but useful; return the bucket corresponding to `key`
  end
end
