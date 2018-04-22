class Player

  attr_accessor :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def create_hand(new_hand)
    @hand = Hand.new(new_hand)
  end

  def hand_value
    hand.find_val
  end

end
