require 'deck'

describe Deck do

  subject(:deck) { Deck.new }
  let(:player) {double("Bob", length: 5, hand: [] )}
  let(:card_set) {double("Diamonds", length: 18)}

  describe '#initialize' do

    it 'makes a full deck' do
      expect(deck.cards.length).to eq(52)
    end

    it 'makes 13 of each suit' do
      expect(deck.cards.select {|card| card.suit == :Hearts}.length).to eq(13)
      expect(deck.cards.select {|card| card.suit == :Spades}.length).to eq(13)
      expect(deck.cards.select {|card| card.suit == :Clubs}.length).to eq(13)
      expect(deck.cards.select {|card| card.suit == :Diamonds}.length).to eq(13)
    end

    it 'makes every card in a suit' do
      diamonds = deck.cards.select {|card| card.suit == :Diamonds}
      expect(diamonds == diamonds.uniq).to be(true)
    end
  end #describe initialize end

  describe '#deal' do
    it 'shuffles the deck' do
      shuffled = deck.cards.shuffle
      expect(shuffled).not_to eq(deck.cards)
    end

    it 'deals five cards to each player' do
      deck.deal(player)
      expect(deck.cards.length).to eq(47)
    end
  end

end
