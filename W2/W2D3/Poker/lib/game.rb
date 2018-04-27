class Game
  attr_accessor :deck
  attr_reader :players

  def initialize
    @players = []
    @deck = Deck.new # shuffled deck

  end

  def play_game
    get_players
    deal_players
    play_round
  end

  def play_round

  end

  def get_players
    puts "How many players?"
    num_players = gets.chomp.to_i

    num_players.times do
      puts "Enter name: "
      name = gets.chomp
      @players << Player.new(name)
    end
  end

  def deal_players
    players.each do |player|
      deal(player)
      player.create_hand
    end
  end

  def deal(player)
    # 5 times because 5 card poker
    new_hand = []
    5.times do
      new_hand << deck.cards.pop
      player.create_hand(new_hand)
    end
  end


end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play_game
end
