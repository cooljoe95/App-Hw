require 'byebug'
require_relative "./minmaxstackqueue"

def windowed_max_range_bad(array, window)

  current_max_range = nil

  (0..array.length - window).each do |i|
    subarray = array[i, window]
    max = subarray.first
    min = subarray.first
    subarray.each do |el|
      max = el if el > max
      min = el if el < min
    end
    if current_max_range.nil? || max - min > current_max_range
      current_max_range = max - min
    end
  end
  current_max_range
end

def windowed_max_range(array, window)
  max_range = nil

  mmsq = MaxMinStackQueue.new

  array.each do |el|
    mmsq.enqueue(el)
  end
  # debugger
  until mmsq.empty?
    cur_range = mmsq.dequeue(window)
    max_range = cur_range if max_range.nil? || cur_range > max_range
  end

  max_range
end

windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6
