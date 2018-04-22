class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    return @store[num]
  end

  private

  def is_valid?(num)
    raise 'Out of bounds' if num >= @store.length || num < 0
  end

  def validate!(num)
  end
end # good


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless include?(num)
      self[num] << num
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    # To look up a number in the set, modulo (%) the number by the set's length, and add it to the array at that index. If the integer is present in that bucket, that's how we know it's included in the set.
    self[num].include?(num)

  end

  private

  def [](num)
    # calling self[num] will be more DRY than @store[num % num_buckets] at every step of the way!
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count += 1
    end

    resize! if @count >= num_buckets
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  attr_reader :store

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    store.length
  end

  def resize!
   new_store = Array.new(num_buckets * 2) { Array.new }

    store.each do |bucket|
      bucket.each { |el| new_store[el % (num_buckets * 2)] << el }
    end

    @store = new_store
  end
end
