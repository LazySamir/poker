class Deck
  # Responsible for state and methods regarding the deck.
  attr_reader :all_cards
  # Constant assigning cards with their values.
  CARD_SCORES = {
    'AH' => 1, '2H' => 2, '3H' => 3, '4H' => 4, '5H' => 5, '6H' => 6, '7H' => 7, '8H' => 8, '9H' => 9, '10H' => 10, 'JH' => 11, 'QH' => 12, 'KH' => 13,
    'AD' => 1, '2D' => 2, '3D' => 3, '4D' => 4, '5D' => 5, '6D' => 6, '7D' => 7, '8D' => 8, '9D' => 9, '10D' => 10, 'JD' => 11, 'QD' => 11, 'KD' => 13,
    'AC' => 1, '2C' => 2, '3C' => 3, '4C' => 4, '5C' => 5, '6C' => 6, '7C' => 7, '8C' => 8, '9C' => 9, '10C' => 10, 'JC' => 11, 'QC' => 12, 'KC' => 13,
    'AS' => 1, '2S' => 2, '3S' => 3, '4S' => 4, '5S' => 5, '6S' => 6, '7S' => 7, '8S' => 8, '9S' => 9, '10S' => 10, 'JS' => 11, 'QS' => 12, 'KS' => 13
  }

  def initialize
    # Every card in deck stored in an array.
    @all_cards = [
      'AH', '2H', '3H', '4H', '5H', '6H', '7H', '8H', '9H', '10H', 'JH', 'QH',
      'KH', 'AD', '2D', '3D', '4D', '5D', '6D', '7D', '8D', '9D', '10D', 'JD',
      'QD', 'KD', 'AC', '2C', '3C', '4C', '5C', '6C', '7C', '8C', '9C', '10C',
      'JC', 'QC', 'KC', 'AS', '2S', '3S', '4S', '5S', '6S', '7S', '8S', '9S',
      '10S', 'JS', 'QS', 'KS'
    ]
  end

  # Randomly selects a card from the deck, removes it from the deck then
  # returns it. This is
  def pick_random_card
    random_card = @all_cards.sample
    remove_card(random_card)
    return random_card
  end

private
  # A private method that removes a card from the deck to remove the chance of
  # a player getting the same card multiple times
  def remove_card(card)
    @all_cards.delete(card)
  end
end
