class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def my_hash
    # [1,2] => our_hash_Integer => 190190132901239012
    i = 0
    self.reduce(0) do |acc, el|
      output = acc + el.my_hash + (i * self[i])
      i += 1
      output
    end
  end
end

class String
  def hash
    str_arr = self.scan(/\w/)

    (0...self.length).map { |i| str_arr[i].ord * i }.reduce(:+)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sorted = self.sort_by {|k, v| k}
    sorted.map  do |k, v|
      if k.is_a?(Symbol) && v.is_a?(Symbol)
        k.object_id ^ v.object_id
      elsif k.is_a?(Symbol)
        k.object_id ^ v.hash
      elsif v.is_a?(Symbol)
        v.object_id ^ k.hash
      else
      k.hash ^ v.hash
      end
    end.hash
  end#def
end#class
