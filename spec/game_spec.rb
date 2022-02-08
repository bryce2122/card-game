require 'rspec'
require_relative  '../lib/game'
require_relative  '../lib/deck'
require_relative '../lib/player'

describe Game do

  let(:deck) { Deck.new }

  describe 'Starting the game' do

    let(:player_1) { double(:player, name: "Joffrey") }
    let(:player_2) { double(:player, name: "Tywin") }
    let(:player_3) { double(:player, name: "Cersei") }
    let(:player_4) { double(:player, name: "Jaime") }
    let(:player_5) { double(:player, name: "Tyrion") }
    subject {Game.new(deck, [player_1, player_2,player_3,player_4,player_5]) }

    it "initializes with an array of players" do
      puts subject.players.count
      expect(subject.players.count).to eq 5
    end
  end


  describe 'scoring and finishing the game' do

    #Needs refactoring to use doubles
    let(:player_1) { Player.new("Tom") }
    let(:player_2) { Player.new("Harry") }
    let(:player_3) { Player.new("Ron") }
    let(:player_4) { Player.new("Sirius") }
    let(:player_5) { Player.new("Ginny") }
    subject {Game.new(deck, [player_1, player_2,player_3,player_4,player_5]) }

    it "checks the rank of the card and returns 13 if King" do
      expect(subject.convert_value("King")).to eq 13
    end


    it "checks the rank of the card and returns the numeric value" do
      expect(subject.convert_value("3")).to eq 3
    end

    before do
      player_1.hand = [["10", "Spades"], ["9", "Clubs"]]
      player_2.hand =  [["King", "Diamonds"], ["4", "Hearts"]]
      player_3.hand = [["Ace", "Hearts"], ["9", "Clubs"]]
      player_4.hand =  [["5", "Diamonds"], ["4", "Hearts"]]
      player_5.hand =  [["3", "Diamonds"], ["4", "Hearts"]]

      subject.calculate_score
    end

    it "calculates the score of each players hand" do
      expect(subject.players.first.score).to eq 19
      expect(subject.players.last.score).to eq 7
    end

    it "returns the winner of the game" do
      expect(subject.winner.name).to eq "Tom"
    end

  end

end
