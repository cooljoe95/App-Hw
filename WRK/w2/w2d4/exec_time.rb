class Array

  def bad_my_min
    self.each do |el|
      self.each_with_index do |el2, i|
        break if el2 < el
        return el if i == self.length - 1
      end
    end
  end

  def good_my_min
    least = self.first
    self.each do |el|
      least = el if el < least
    end
    least
  end

  def good_my_max
    max = self.first
    self.each do |el|
      max = el if el > max
    end
    max
  end

  def bad_largest_contiguous_subsum
    subsets = []
    largest = nil
    length.times do |i|
      (i...length).each do |j|
        subsets << self[i..j]
      end
    end
    subsets.each do |subarray|
      sum = subarray.inject(:+)
      if largest.nil? || sum > largest
        largest = sum
      end
    end
    largest
  end

  def good_largest_contiguous_subsum
    return good_my_max if good_my_max < 0
    best_sum = self.first
    running_sum = self.first
    (1...length).each do |i|
      if (running_sum += self[i]) < 0
        running_sum = 0
      end
      if running_sum > best_sum
        best_sum = running_sum
      end
    end
    best_sum
  end
end
