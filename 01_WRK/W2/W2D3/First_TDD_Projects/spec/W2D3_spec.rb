require 'W2D3'
require 'rspec'

describe '#my_uniq' do
  input_arr = [1,2,3,3]
  it 'returns unique values' do
    expect(my_uniq(input_arr)).to eq([1,2,3])
  end

  it 'doesn\'t modifiy original array' do
    my_uniq(input_arr)
    expect(input_arr).to be(input_arr)
  end
end

describe '#two_sum' do
  it 'does not return a pair if none add to 0' do
    expect(two_sum([-2, 1])).to eq([])
  end

  it 'orders pairs by first index' do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0,4], [2,3]])
  end

  it 'returns an array' do
    expect(two_sum([]).class).to eq(Array)
  end

  # empty array
end

rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

describe '#my_transpose' do
  it 'sets every element of the first array as the first value of each row' do
    expect(my_transpose(rows).map {|el| el.first} ).to eq([0,1,2])
  end

  it 'sets the first value of every row within the first array' do
    expect(my_transpose(rows).first).to eq([0,3,6])
  end

  it 'doesn\'t change the length of the nested arrays' do
    expect(my_transpose(rows).length).to eq(rows.length)
  end
end

describe '#stock_picker' do
  stock_prices = [24, 24, 24, 26, 27, 38, 2, 23]

  it 'takes an array' do
    expect(stock_picker(stock_prices).class).to be(Array)
  end

  buy_date, sell_date = stock_picker(stock_prices)

  it 'sells after it buys' do
    expect(sell_date > buy_date).to be(true)
  end

  it 'buys at a lower price than the sell price' do
    expect(stock_prices[buy_date] < stock_prices[sell_date]).to be(true)
  end

  it 'buys at lowest possible price' do
    start_date = stock_picker(stock_prices)[0] # stock_picker => [start, end]
    expect(start_date).to be(stock_prices.index(2))
  end

  it 'sells at highest possible price' do
    end_date = stock_picker(stock_prices)[1]
    expect(end_date).to be(stock_prices.index(23))
  end

end


describe TowersOfHanoi do

  subject(:game) { TowersOfHanoi.new }

  describe "#prompt" do
    it 'Receives user input' do
      allow($stdin).to receive(:gets).and_return("1\n")
      expect(game.prompt).to eq(1)
    end
  end

  describe '#initialize' do
    it 'Has three towers' do
      expect(game.towers.length).to be(3)
    end

    it 'starts with 3 discs on tower 1' do
      expect(game.towers[0].length).to be(3)
    end

    it 'starts 0 discs on tower 2 + 3' do # two expects?
      expect(game.towers[1].length).to be(0)
      expect(game.towers[2].length).to be(0)
    end
  end

  describe '#moves_discs' do

    context 'Valid move:' do
      it 'moves a disc from from_tower onto to_tower' do
        expect( game.move_disc(0,1) ).to eq([[3,2],[1],[]])
      end
    end

    context 'Invalid move:' do
      it 'cannot select from an empty tower' do
        expect{ game.move_disc(2,0) }.to raise_error("ERROR: Cannot move from empty tower.")
      end

      it 'Not moving a larger disc onto smaller disc' do
        game.move_disc(0,1) #=> [3,2],[1],[]]
        expect{ game.move_disc(0,1) }.to raise_error("Can\'t move big onto little!!!")
      end
    end
  end # describe

  describe '#game_over?' do
    let(:winning_tower) { double( "game", towers: [[],[3,2,1],[]] ) }

    context 'game_over?' do
      it 'returns true' do
        allow(winning_tower).to receive(:game_over?).and_return(true)
        expect(winning_tower.game_over?).to be(true)
      end
    end
  end
end
