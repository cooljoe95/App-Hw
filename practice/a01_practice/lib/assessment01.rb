class Array
  def my_inject(accumulator = nil)
    
  end
end

def is_prime?(num)
end

def primes(count)
  if count <= 0
    return []
  end
  counter = 1
  primes = [2]
  idx = 3
  while counter != count
    possible_prime = primes.select{|num| idx % num == 0}
    if possible_prime == []
      primes << idx
      counter += 1
    end
    idx += 1
  end
  primes
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  if num == 1
    return [1]
  elsif num == 2
    return [1,1]
  else
    results = factorials_rec(num-1)
    results << (num-1) * results[-1]
  end
  results
end

class Array
  def dups
    all_locs = {}
    duplicate_locs = {}
    self.each_with_index do |el, idx|
      if all_locs[el] == nil
        all_locs[el] = idx
      elsif duplicate_locs[el] == nil
        duplicate_locs[el] = [all_locs[el], idx]
      else
        duplicate_locs[el] << idx
      end
    end
    duplicate_locs
  end
end

class String

  def is_symmetric(word)
    if word == ""
      return true
    else
      return false unless word[0] == word[-1]
      is_symmetric(word[1...-1])
    end
  end

  def symmetric_substrings
    results = []
    (0...self.length).each do |i|
      ((i+1)...self.length).each do |j|
        if is_symmetric(self[i..j])
          results << self[i..j]
        end
      end
    end
    results
  end
end

class Array
  def merge_sort(&prc)
    return self if self.size <= 1
    left = self[0...self.length/2].merge_sort{prc}
    right = self[self.length/2..-1].merge_sort{prc}
    Array.merge(left.dup, right.dup) {|num1, num2| num1 <=> num2}
  end

  private
  def self.merge(left, right, &prc)
    results = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) < 0
        results << left.shift
      else
        results << right.shift
      end
    end
    results += left
    results += right
  end
end
