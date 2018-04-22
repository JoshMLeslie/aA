require 'byebug'
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, next_ = nil, prev = nil)
    @key = key
    @val = val
    @next = next_
    @prev = prev
  end

  def set_next(next_node)
    # sets incoming's head and tail, relatively.
    self.next = next_node
    next_node.prev = self
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # connects previous link to next link and removes self from list.
    @next.prev, @prev.next = @prev , @next

    @key, @val, @prev, @next = nil # makes it dead
  end
end #class end


class LinkedList

  include Enumerable

  def initialize
    # head and tail => constant sentinels
    @head = Node.new
    @tail = Node.new
    @length = 2

    @head.set_next(@tail)
  end

  def length
    @length - 2
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def second
    first.next
  end

  def last
    @tail.prev
  end

  def empty?
    @length == 2
  end

  def get(key)
    search_val = nil
    self.each {|node| search_val = node.val if node.key == key}
    search_val
  end

  def include?(key)
    included = false
    self.each {|node| included = true if node.key == key}
    included
  end

  def append(key, val)
    unless include?(key)
      prev_last = @tail.prev
      new_node = Node.new(key, val)
      prev_last.set_next(new_node)
      new_node.set_next(@tail)
      @length += 1
    end

    new_node
  end

  def update(key, val)
    if include?(key)
      node = get_node(key)
      node.val = val
    end
  end

  def remove(key)
    if include?(key)
      node = get_node(key)
      node.remove
    end
  end

  def eject_first!
    # removes value nearest head
    nearest_head = first
    nearest_key = nearest_head.key
    after_nearest = second

    remove(nearest_key)
    @head.set_next(after_nearest)
    return nearest_key
  end

  def each(key=nil, &prc)
    prc ||= Proc.new{|node| node.key == key }

    current_node = @head.next
    until current_node == @tail
      prc.call(current_node)
      current_node = current_node.next
    end
    self
  end

  def get_node(key)
    node = nil
    self.each {|noodle| node = noodle if noodle.key == key}
    node
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
