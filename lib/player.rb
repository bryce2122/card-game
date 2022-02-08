class Player

  attr_accessor :hand, :score
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = []
    @score = 0
  end

  def print_score
    first_card, second_card = hand[0],hand[1]
    puts "#{name} was dealt the cards #{first_card.join(" of ")} and #{second_card.join(" of ")}"
    puts "#{name} has a total score of #{score}"
    puts "---------------------------------------------"
  end

  def return_cards
    cards = @hand
    @hand = []
    cards
  end

end
