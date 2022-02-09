class Game

  attr_reader :deck, :players, :round

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
    if winners.length > 1
      puts "And the winners of round #{round} are: #{winners.join(",")}"
    else
      puts "And the winner of round #{round} is: #{winners.join(" ")}"
    end
    return_cards
  end

  # Calculate each player's total score after a round
  def calculate_game_scores
    calculate_score
    players.each do |player|
      player.print_score
    end
  end

  def deal_cards(cards)
    @players.each do |player|
      player.hand = []
      player.score = 0
      player.hand += deck.cards.pop(cards)
    end
  end

  def return_cards
    players.each { |player| deck.return(player.return_cards) }
  end

  def calculate_score
    players.each do |player|
      player.hand.each do |rank, suit|
        player.score += convert_value(rank)
      end
    end
  end

  #Find the players with the highest score at the end of a round
  def winners
    winner_array = players.group_by {|player| player.score}.max[1]
    winner_array.map {|player| player.name}
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
