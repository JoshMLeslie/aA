require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count, :prc
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc || Proc.new { |x| x ** 2 }
  end

  def count
    @map.count
  end

  def get(key)
    val = calc!(key)

    if @map.include?(key)
      @store.remove(key)
      update_node!(key,val)
    else
      update_node!(key,val)
      eject! if @store.length > @max
    end

    val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    # prc.call(x) == x ** 2
    @map.include?(key) ? @map[key].val : @prc.call(key)
  end

  def update_node!(key,val)
    # suggested helper method; move a node to the end of the list
    new_node = @store.append(key, val)
    @map[key] = new_node
  end

  def eject!
    prev_first_key = @store.eject_first!
    @map.delete(prev_first_key)
  end
end
