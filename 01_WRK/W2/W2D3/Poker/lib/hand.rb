require_relative 'game'

class Hand

  FACE_VALUES = {
    One: 1,
    Two: 2,
    Three: 3,
    Four: 4,
    Five: 5,
    Six: 6,
    Seven: 7,
    Eight: 8,
    Nine: 9,
    Ten: 10,
    Jack: 11,
    Queen: 12,
    King: 13,
    Ace: 14
  }

  SUITS = [:Hearts, :Spades, :Clubs, :Diamonds]

  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def find_val
    return 1 if straight_flush?
    return 2 if four_of_a_kind?
    return 3 if full_house?
    return 4 if flush?
    return 5 if straight?
    return 6 if three_of_a_kind?
    return 7 if two_pair?
    return 8 if one_pair?
    return 9 if high_card?
  end

  def count_(val_or_suit,to_num)
    counter = Hash.new(0)
    hand.each { |card| counter[card.val_or_suit] += 1 }
    return counter.has_value?(to_num)
  end

  def get_hand_range
    sorted_hand = hand.sort_by { |card| FACE_VALUES[card.value]}
    max = sorted_hand.last.value.max
    min = sorted_hand.last.value.min
    return [max - min, max, min]
  end

  def straight_flush?
    card_suit = hand.first.suit
    return (hand.all? { |card| card.suit == card_suit } && get_hand_range[0] == 4)
  end

  def four_of_a_kind?
    count_(value,4)
  end

  def full_house?
    three_of_a_kind? && two_pair?
  end

  def flush?
    count_(suit,5)
  end

  def straight?
    get_hand_range[0] == 4 && card.values.uniq.length == 5
  end

  def three_of_a_kind?
    count_(value,3)
  end

  def two_pair?
    pairs = 0
    counter = Hash.new(0)
    hand.each { |card| counter[card.value] += 1 }
    counter.each { |key, count|   pairs += 1 if count == 2 }
    return pairs == 2
  end

  def one_pair?
    count_(value, 1)
  end

  def high_card?
    get_hand_range[1]
  end

end
