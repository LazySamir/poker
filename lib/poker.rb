class Poker
  # will need to instantiate with a player later
  # will instantiate with deck instance, now: hardcode
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
  end

  def deal_cards
    # make array with number of elements equal to no_players(array of arrays)
    all_hands = []
    @handsize.times { all_hands.push([]) }
    # array.each do
    all_hands.each do |hand|
      # repeat until array[element].length == handsize
      until hand.length == @handsize do
        # add a random card from the deck to first element
        hand << @deck.sample
        # remove that card from the deck
        @deck - [hand[-1]]
      end
    end
    puts "all-hands #{all_hands}"
    puts "deck #{@deck}"
  end
end
