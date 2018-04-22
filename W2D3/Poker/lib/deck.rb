require_relative 'card'

class Deck

  attr_accessor :cards

  CARD_VALS = [:One, :Two, :Three, :Four, :Five, :Six, :Seven,
               :Eight, :Nine, :Ten, :Jack, :Queen, :King, :Ace]
  SUITS = [:Hearts, :Spades, :Clubs, :Diamonds]

  def initialize
    @cards = populate_deck
  end

  def populate_deck
    deck = []
    SUITS.each do |suit|
      CARD_VALS.each do |val|
        deck << Card.new(val, suit)
      end
    end

    deck.shuffle!
  end

end # class end

# TESTING #
# deck = Deck.new
# puts deck.cards.select { |card| card.suit == :Diamonds}.length
