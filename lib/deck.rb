class Deck

  #Constants for standard deck of playing cards
  CARD_COUNT = 52
  RANKS = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}
  SUITS = %w{Spades Hearts Diamonds Clubs}

  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def create_deck
    @cards = RANKS.product(SUITS)
  end

  def return(cards)
    @cards.push(*cards)
  end

  def shuffle
   @cards.shuffle!
  end

end
