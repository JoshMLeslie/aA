require 'byebug'

require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap

  include Enumerable


  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket = find_bucket(key)
    bucket.include?(key)
  end

  def set(key, val)
    resize! if count == num_buckets

    bucket = find_bucket(key)
    if bucket.include?(key)
      bucket.update(key, val)
    else
      bucket.append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket = find_bucket(key)
    return bucket.get(key)
    nil
  end

  def delete(key)
    bucket = find_bucket(key)
    @count -= 1 if bucket.include?(key)
    bucket.remove(key)
  end

  def each(&prc)
    @store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key, node.val)
      end
    end
    self
  end


  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    dup_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new }

     dup_store.each do |bucket|
       bucket.each { |node| self.set(node.key,node.val) }
     end
  end

  def find_bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
