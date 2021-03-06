require_relative 'p02_hashing'

class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets

    unless include?(key)
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  attr_reader :store

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
    store[key.hash % num_buckets]
  end

  def num_buckets
    store.length
  end

  def resize!
    dup_store = store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

     store.each do |bucket|
       bucket.each { |el| self.insert(el) }
     end
  end
end
