require 'card'

describe Card do

  subject(:card) { Card.new(6, :hearts) }

  describe "#initialize" do
      it 'accepts a value and a suit' do
        expect(card.value).to eq(6)
        expect(card.suit).to eq(:hearts)
      end
  end
end
