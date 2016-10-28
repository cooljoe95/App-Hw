class Fixnum
  # Fixnum#hash already implemented for you
end
require 'byebug'
class Array
  def hash
    sum = 0
    self.each_with_index do |el, i|
      sum += (el.hash ^ i) << i
    end
    sum
  end
end

class String
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    final = []
    self.each do |el|
      final << el
    end
    final.sort.hash
  end
end
