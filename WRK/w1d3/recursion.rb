def range(starter,ender)
  return [] if ender < starter
  [starter] + range(starter + 1,ender)
end

def sum(arr)
  return 0 if arr.length == 0
  arr.pop + sum(arr)
end

def sum_it(arr)
  return 0 if arr.length == 0
  arr.inject(:+)
end

def exp(base, power)
  return 1 if power == 0
  base * exp(base,power-1)
end

def exp2(base, power)
  return 1 if power == 0
  return base if power == 1
  if power.even?
    return exp2(base, power / 2) ** 2
  else
    return base * (exp2(base, (power-1) ))#/ 2) ** 2)
  end

end


class Array
  def deep_dup
    return [] if self.length == 0
    if not self[0].is_a?(Array)
      [self.first] + self[1..-1].deep_dup
    else
      [self.first.deep_dup] + self[1..-1].deep_dup
    end
  end
end

def fib(n)
  return nil if n < 1
  return [1] if n == 1
  return [1,1] if n == 2
  prev = fib(n-1)
  prev << prev[-1] + prev[-2]
end

def fib_int(n)
  return nil if n < 1
  return [1] if n == 1
  return [1,1] if n == 2
  ar = [1,1]
  (2...n).each do |i|
    ar << ar[-1] + ar[-2]
  end
  ar
end

def bsearch(array, target)
  midpoint = array.length/2
  return nil if array == []
  return nil if array.length == 1 && target != array.first

  if array[midpoint] == target
    return midpoint
  elsif target < array[midpoint]
    bsearch(array[0...midpoint], target)
  else
    j =  bsearch(array[midpoint..-1], target)
    return nil if j == nil
    midpoint + j
  end

end

def merge_sort(arr)
  return arr if arr.length <= 1
  midpoint = arr.length / 2
  arr_left = merge_sort(arr[0...midpoint])
  arr_right = merge_sort(arr[midpoint..-1])
  merge(arr_left, arr_right)


end

def merge(arr1,arr2)
  result = []
  while !arr1.empty? && !arr2.empty?
    if arr1.first > arr2.first
      result << arr2.shift
    else
      result << arr1.shift
    end
  end

  result += arr2
  result += arr1

end



class Array

  def deep_dup
    return [] if self.length == 0
    if self[0].is_a?(Array)
      [self.first.deep_dup] + self[1..-1].deep_dup
    else
      [self.first] + self[1..-1].deep_dup
    end
  end


  def subsets(arr = self)
    # base case goes here
    if arr.empty?
      return [[]]
    end

    without_last_el = subsets(arr[0...-1])
    with_last_el = without_last_el.deep_dup
    (0...with_last_el.length).each do |i|
      with_last_el[i] << arr[-1]
    end
    without_last_el + with_last_el
  end
end

def greedy(num,coins)
  return [num] if num == coins.first
  result = []
  if num > coins.first
    result << coins.first
    result += greedy(num-coins.first,coins)
  else
    coins.shift
    result += greedy(num,coins)
  end
  result
end


def better(num, coins=[25, 10, 5, 1])
  return [] if num == 0
  return [num] if num == coins.last
  best_result = []
  coins.each do |coin|
    result = []

    if coin <= num
      result << coin
      result += better(num-coin, coins)
    else
      result += better(num, coins[1..-1])
    end

    if best_result == [] || result.length < best_result.length
      best_result = result
    end
  end

  best_result
end
