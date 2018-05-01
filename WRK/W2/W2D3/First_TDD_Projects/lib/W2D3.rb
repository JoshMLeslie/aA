def my_uniq(array)
  result = Hash.new(0)
  array.each do |el|
    result[el] += 1
  end
  result.keys
end

def two_sum(array)
  result = []
  0.upto(array.length - 2) do |ia|
    1.upto(array.length - 1) do |ib|
      next if ia == ib
      first = array[ia]
      second = array[ib]
      result << [ia, ib] if (first + second).zero? && ib > ia
    end
  end
  result
end

def my_transpose(array)
  transposed = Array.new(array.length) { [] }
  array.each do |row|
    row.each_with_index do |col, col_idx|
      transposed[col_idx] << col
    end
  end
  transposed
end

def stock_picker(array)
  deltas = delta_subsets(array)

  deltas.sort_by{|k,v| v}[-1][0]
end

def delta_subsets(array)
  delta = {}

  i = 0
  while i < array.length - 1
    j = i + 1

    while j < array.length
      key = [i,j]
      delta[key] = array[j] - array[i]
      j += 1
    end # j

    i += 1
  end # i

 delta # the little delta that could
end

class TowersOfHanoi

  attr_reader :towers

  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def prompt
    puts "Where would you like to select from?"
    from = $stdin.gets.chomp.to_i
    # puts "Where would you like to put your disc?"
    # to = $stdin.gets.chomp.to_i
  end

  def move_disc(from_tower, to_tower)
    from_tower = towers[from_tower] #reassigning index as value
    to_tower = towers[to_tower]
    if from_tower.empty?
      raise 'ERROR: Cannot move from empty tower.'
    elsif from_tower.last && to_tower.last
      raise 'Can\'t move big onto little!!!' if to_tower.last < from_tower.last
    end
    to_tower.push(from_tower.pop)
    towers
  end

  def game_over?
    towers[1].length == 3 || towers[2].length == 3
  end

end
