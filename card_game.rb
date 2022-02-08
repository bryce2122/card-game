require './lib/game'
require './lib/player'
require './lib/deck'

def initialize_game
    @players = []
    get_player_names
    @game = Game.new(Deck.new,@players)
end

def get_player_names
  puts "Please enter the name of the first player:"
  5.to_i.times do |player|
    player = gets.chomp
    @players << Player.new(player)
    puts "Please enter the name of the next player:"
  end
end

def play_game
  @game.play_round
  @game.end_round
  puts "Do you want to play another round(y/n)"
  if gets.chomp.downcase == "y"
    play_game
  else
    puts "Game Over"
  end
end

initialize_game
play_game
