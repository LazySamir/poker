class Game

  attr_reader :hand_scores, :all_hands
  # will need to instantiate with a player later
  # will instantiate with deck instance, now: hardcode
  CARD_SCORES = {
    'AH' => 1, '2H' => 2, '3H' => 3, '4H' => 4, '5H' => 5, '6H' => 6, '7H' => 7, '8H' => 8, '9H' => 9, '10H' => 10, 'JH' => 11, 'QH' => 12, 'KH' => 13,
    'AD' => 1, '2D' => 2, '3D' => 3, '4D' => 4, '5D' => 5, '6D' => 6, '7D' => 7, '8D' => 8, '9D' => 9, '10D' => 10, 'JD' => 11, 'QD' => 11, 'KD' => 13,
    'AC' => 1, '2C' => 2, '3C' => 3, '4C' => 4, '5C' => 5, '6C' => 6, '7C' => 7, '8C' => 8, '9C' => 9, '10C' => 10, 'JC' => 11, 'QC' => 12, 'KC' => 13,
    'AS' => 1, '2S' => 2, '3S' => 3, '4S' => 4, '5S' => 5, '6S' => 6, '7S' => 7, '8S' => 8, '9S' => 9, '10S' => 10, 'JS' => 11, 'QS' => 12, 'KS' => 13
  }

  def initialize(no_players, handsize)
    @deck = [
      'AH', '2H', '3H', '4H', '5H', '6H', '7H', '8H', '9H', '10H', 'JH', 'QH',
      'KH', 'AD', '2D', '3D', '4D', '5D', '6D', '7D', '8D', '9D', '10D', 'JD',
      'QD', 'KD', 'AC', '2C', '3C', '4C', '5C', '6C', '7C', '8C', '9C', '10C',
      'JC', 'QC', 'KC', 'AS', '2S', '3S', '4S', '5S', '6S', '7S', '8S', '9S',
      '10S', 'JS', 'QS', 'KS'
    ]
    @no_players = no_players
    @handsize = handsize
    @all_hands = []
    @hand_scores = []
  end

  def deal_cards
    create_empty_hands
    @all_hands.each do |hand|
      # repeat until array[element].length == handsize
      until hand.length == @handsize do
        # add a random card from the deck to first element
        hand << pick_random_card
        # NEED TO REMOVE CARD FROM DECK
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
    return @hand_scores.each_with_index.max[1] + 1
  end

private

  def create_empty_hands
    # make array with number of elements equal to no_players(array of arrays)
    @no_players.times do
      @all_hands.push([])
    end
  end

  def pick_random_card
    @deck.sample
  end

  def score_hand(hand)
    score = 0
    hand.each do |card|
      score += CARD_SCORES[card]
    end
    @hand_scores << score
  end
end
