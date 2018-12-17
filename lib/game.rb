class Game
  # Responsible for state and method regarding the the progression
  # of the game.
  attr_reader :hand_scores, :all_hands

  # Instantiates with:
  # No_player and handsize to determine card dealing
  # All_hands and all_scores as empty arrays.
    # These will be populated with further arrays depending on the number of players.
  # An instance of Deck injected.
  def initialize(no_players, handsize, deck = Deck.new)
    @no_players = no_players
    @handsize = handsize
    @all_hands = []
    @hand_scores = []
    @deck = deck
  end

  # Responsible for adding the correct number of random cards to each hand
  def deal_cards
    # First calls a private method to create an array of arrays equal to the
    # number of players. Each sub array representing one players hand.
    create_empty_hands
    # Iterates over array of all hands and populates them with random cards
    # until they reach their handlimit
    @all_hands.each do |hand|
      until hand.length == @handsize do
        hand << @deck.pick_random_card
      end
    end
  end

  # Responsible for calculating the score all hands
  def score_hands
    @all_hands.each do |hand|
      # Calls for a private method to calculate score of inividual hands
      score_hand(hand)
    end
  end

  # Responsible for determining the winner of the round.
  # Players hands are ordered by their all_hands array index -1
  # i.e. player 2's score is represented at @hand_scores[1]
  # This returns the number of the player who won.
  def declare_winner
    # iterates over hand_scores and returns the index +1
    return @hand_scores.each_with_index.max[1] + 1
  end

private

  # Creates array with number of elements equal to no_players(array of arrays)
  def create_empty_hands
    @no_players.times do
      @all_hands.push([])
    end
  end

  # Iterates over each card in a given hand, calls a method in Deck class to
  # looks up the cards associated value via a all_cards hash
  def score_hand(hand)
    score = 0
    hand.each do |card|
      score += @deck.get_card_value(card)
    end
    @hand_scores << score
  end
end
