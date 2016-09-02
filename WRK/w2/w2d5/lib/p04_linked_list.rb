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
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    get_link(key).val
  end

  def include?(key)
    !get(key).nil?
  end

  def insert(key, val)
    found = get_link(key)
    unless found == @tail
      found.val = val
    end

    new_link = Link.new(key, val)
    insert_link(new_link)
  end

  def insert_link(new_link)
    @tail.prev.next = new_link
    new_link.next = @tail
    new_link.prev = @tail.prev
    @tail.prev = new_link
  end

  def remove(key)
    link = get_link(key)
    return nil if link == @tail
    remove_link(link)
  end

  def remove_link(link)
    next_link = link.next
    prev_link = link.prev

    next_link.prev = prev_link
    prev_link.next = next_link
  end


  def get_link(key)
    self.each {|link| return link if link.key == key}
    @tail
  end

  def each(&prc)
    this_link = @head.next
    until this_link == @tail
      prc.call(this_link)
      this_link = this_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
