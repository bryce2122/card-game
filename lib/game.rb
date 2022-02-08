class Game

  attr_reader :deck, :players
  attr_accessor :round

  #Initializing the game with players and deck of cards
  def initialize(deck, players)
    @deck = deck
    @players = players
    @round = 0
  end

  def play_round
    deck.shuffle
    deal_cards(2)
    @round += 1
    puts "Round #{round} has started and each player has been dealt 2 cards"
    puts "-----------------------------------"
  end

  def end_round
    calculate_game_scores
    puts "And the winner of round #{round} is: #{winner.name}"
    return_cards
  end

  def calculate_game_scores
    calculate_score
    players.each do |player|
      player.print_score
    end
  end

  #Dealing cards, can take any number as argumet for the number of cards dealt
  def deal_cards(cards)
    @layers.each do |player|
      player.hand = []
      player.score = 0
      player.hand += deck.cards.pop(cards)
    end
  end

  def return_cards
    players.each { |player| deck.return(player.return_cards) }
  end


  # calculate each player's total score after a round
  def calculate_score
    players.each do |player|
      player.hand.each do |rank, suit|
        player.score += convert_value(rank)
      end
    end
  end


  def winner
    players.max_by do |player|
      player.score
    end
  end

  #Convert cards' rank to numeric values
  def convert_value(value)
    case value
    when 'King' then 13
    when 'Queen' then 12
    when 'Jack' then 11
    when 'Ace' then 1
    else value.to_i
    end
  end
end
