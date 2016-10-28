class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head ? @head.val : nil
  end

  def last
    @tail ? @tail.val : nil
  end

  def empty?
    @head == nil
  end

  def get(key)
    tmp = @head
    while tmp
      return tmp.val if tmp.key == key
      tmp = tmp.next
    end
    nil
  end

  def include?(key)
    tmp = @head
    while tmp
      return true if tmp.key == key
      tmp = tmp.next
    end
    false
  end

  def insert(key, val)
    tmp = Link.new(key, val)
    tmp.prev = @tail
    @tail.next = tmp if @tail
    @head = tmp if tmp.prev == nil
    @tail = tmp
  end

  def remove_head
    tmp = @head
    @head = @head.next
    @tail = nil if @head == nil
    tmp.next, tmp.prev = nil
    return tmp.val
  end

  def remove_tail
    tmp = @tail
    @tail.prev.next = nil
    @tail = @tail.prev
    tmp.next, tmp.prev = nil
    return tmp.val
  end

  def remove_inner_node(tmp)
    tmp.prev.next = tmp.next
    tmp.next.prev = tmp.prev
    tmp.next, tmp.prev = nil
    return tmp.val
  end

  def remove_node!(tmp)
    if tmp == @head
      return remove_head
    elsif tmp == @tail
      return remove_tail
    else
      return remove_inner_node(tmp)
    end
  end

  def remove(key)
    tmp = @head
    while tmp
      return remove_node!(tmp) if tmp.key == key
      tmp = tmp.next
    end
    nil
  end

  def each
    tmp = @head
    while tmp
      yield tmp
      tmp = tmp.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
