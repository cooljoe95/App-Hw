class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    left = array.drop(1).select{ |el| el < array[0] }
    right = array.drop(1).select{ |el| el >= array[0] }
    QuickSort.sort1(left) + [array[0]] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return if length <= 1
    part_idx = self.partition(array, start, length, &prc)
    self.sort2!(array, start, part_idx - start, &prc)
    self.sort2!(array, part_idx + 1, start + length - part_idx - 1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    left_idx = start + 1
    right_idx = start + length - 1

    prc ||= Proc.new {|e1, e2| e1 <=> e2 }

    pivot = array[start]
    while left_idx <= right_idx
      while left_idx <= right_idx && prc.call(array[left_idx], pivot) < 0
        left_idx += 1
      end
      while left_idx <= right_idx && prc.call(array[right_idx], pivot) >= 0
        right_idx -= 1
      end
      if left_idx <= right_idx
        array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
        left_idx += 1
        right_idx -= 1
      end
    end
    array[start], array[right_idx] = array[right_idx], array[start]
    right_idx
  end
end
