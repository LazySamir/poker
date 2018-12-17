class Game

  attr_reader :hand_scores, :all_hands, :deck
  # will need to instantiate with a player later

  def initialize(no_players, handsize, deck = Deck.new)
    @no_players = no_players
    @handsize = handsize
    @all_hands = []
    @hand_scores = []
    @deck = deck
  end

  def deal_cards
    create_empty_hands
    @all_hands.each do |hand|
      # repeat until array[element].length == handsize
      until hand.length == @handsize do
        # add a random card from the deck to first element
        hand << @deck.pick_random_card
      end
    end
  end

  def score_hands
    @all_hands.each do |hand|
      score_hand(hand)
    end
    @hand_scores
  end

  def declare_winner
    # returns number of player who wins
    return @hand_scores.each_with_index.max[1] + 1
  end

private

  def create_empty_hands
    # make array with number of elements equal to no_players(array of arrays)
    @no_players.times do
      @all_hands.push([])
    end
  end

  def score_hand(hand)
    score = 0
    hand.each do |card|
      score += Deck::CARD_SCORES[card]
    end
    @hand_scores << score
  end
end
