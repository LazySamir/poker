describe Deck do
  subject(:deck)   { Deck.new }

  describe '#pick_random_card' do
    it 'returns a card' do
      expect(deck.pick_random_card).to be
    end
    it 'removes a cards from the all_cards' do
      deck.pick_random_card
      expect(deck.all_cards.length).to eq(51)
    end
  end
end
