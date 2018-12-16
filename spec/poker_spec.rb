describe Game do
  subject(:game)   { Game.new(2, 4) }

  describe '#deal_cards' do
    it 'adds cards to each hand' do
      srand(1)
      game.deal_cards
      expect(game.all_hands).to eq([["QC", "6S", "KH", "9H"], ["JH", "2D", "6H", "8D"]])
    end
    it 'removes a cards from the deck' do
      game.deal_cards
      expect(game.deck.length).to eq(44)
    end
  end
  describe '#score_hands' do
    it 'adds the hand scores' do
      srand(1)
      game.deal_cards
      game.score_hands
      expect(game.hand_scores).to eq([40, 27])
    end
  end
  describe '#declare_winner' do
    it 'returns winning player number' do
      srand(1)
      game.deal_cards
      game.score_hands
      expect(game.declare_winner).to eq(1)
    end
  end
end
