require 'hand'

describe Hand do

  subject(:player_hand) {Hand.new('Bob')}
  let(:straight_flush) {double("straight_flush", value: 1)}
  let(:four_of_a_kind) {double("four_of_a_kind", value: 2)}
  let(:one_pair) {double("one_pair", value: 8)}

  describe "#initialize" do
    it 'takes a player' do
      expect(player_hand.player).to eq('Bob')
    end

    it 'takes an array of five cards' do
      expect(player_hand.cards.length).to eq(5)
    end

    it 'contains only unique cards' do
      expect(player_hand.cards.uniq.length).to eq(5)
    end
  end

  describe '#hand_value' do
    it 'it correctly identifies hand values' do
      expect(one_pair.value).to eq(8)
      expect(four_of_a_kind.value).to eq(2)
      expect(straight_flush.value).to eq(1)
    end
  end

  describe "#compare_hands" do
    it 'ranks straight flush highest' do
      expect(compare_hands(straight_flush,one_pair)).to eq(straight_flush)
    end

    it 'ranks one_pair lower than four_of_a_kind' do
      expect(compare_hands(one_pair,four_of_a_kind)).to eq(four_of_a_kind)
    end
  end

end
