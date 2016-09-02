#n^2
def bad_two_sum?(array, target)

  array.length.times do |i|
    ((i + 1)...array.length).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false

end

# n log n
def okay_two_sum?(array, target)
  sorted = array.sort
  i = 0
  j = array.length - 1

  while i < j
    return true if sorted[i] + sorted[j] == target
    diff = sorted[i] + sorted[j] <=> target
    case diff
    when -1
      i += 1
    when 0
      break
    when 1
      j -= 1
    end
  end

  false
end
  #
  #
  # sorted.each_with_index do |el, i|
  #   found = sorted.bsearch { |x| x == (target - el) }
  #   if found == el
  #     if i == 0
  #       next unless sorted[i + 1] == el
  #     end
  #     next unless sorted[i - 1] == el || sorted[i + 1] == el
  #   end
  #   return true if found
  # end
  # false
# end

# n
def best_two_sum?(array, target)
  hash = {}

  array.each do |el|
    return true if hash[target - el]
    hash[el] = true
  end

  false
end
