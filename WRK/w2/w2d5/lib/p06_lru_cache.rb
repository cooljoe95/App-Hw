require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      link = @map.get(key)
      update_link!(link)
      return link.val
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    if @map.count >= @max
      eject!
    end
    value = @prc.call(key)
    link = Link.new(key, value)
    @store.insert_link(link)
    @map.set(key, link)
    value
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    @store.remove_link(link)
    @store.insert_link(link)
  end

  def eject!
    @map.delete(@store.first.key)
    @store.remove_link(@store.first) unless @store.empty?
  end
end
