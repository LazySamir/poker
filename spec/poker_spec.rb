describe Game do
  subject(:game)   { Game.new(2, 4) }

  describe '#deal_cards' do
    it 'adds cards to each hand' do
      srand(1)
      game.deal_cards
      expect(game.all_hands).to eq([["QC", "5S", "KH", "9H"], ["10H", "QH", "6H", "3D"]])
    end
    # card is removed from deck
  end
  describe '#score_hands' do
    it 'adds the hand scores' do
      srand(1)
      game.deal_cards
      game.score_hands
      expect(game.hand_scores).to eq([39,31])
    end
  end
  describe '#score_hands' do
    it 'adds the hand scores' do
      srand(1)
      game.deal_cards
      game.score_hands
      expect(game.declare_winner).to eq(1)
    end
  end
end
