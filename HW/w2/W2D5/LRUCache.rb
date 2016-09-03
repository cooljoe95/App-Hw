# require 'byebug'
class LRUCache

	attr_accessor :cache, :max_size

	def initialize(size = 3)
		self.max_size = size
		self.cache = []
  end

  def count
    # returns number of elements currently in cache
		self.cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
		# debugger
		loc = find_el(el)
		# p loc
		if loc.nil?
			self.cache << el
			self.cache = self.cache[1..-1] if count > self.max_size
		else
			self.cache = self.cache.take(loc).concat(self.cache.drop(loc + 1))
			self.cache << el
		end

  end

  def show
    # shows the items in the cache, with the LRU item first
		print self.cache
  end

  private
  # helper methods go here!
	def find_el(el)
		(0...self.cache.length).each do |i|
			return i if self.cache[i] == el
		end
		nil
	end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
