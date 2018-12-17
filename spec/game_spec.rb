describe Game do
  subject(:game)   { Game.new(2, 4) }

  describe '#deal_cards' do
    it 'adds cards to each hand' do
      srand(1)
      game.deal_cards
      expect(game.all_hands).to eq([["QC", "6S", "KH", "9H"], ["JH", "2D", "6H", "8D"]])
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
  describe '#valid_params?' do
    let(:valid_game1) {Game.new(4, 8)}
    let(:valid_game2) {Game.new(10, 20)}
    let(:invalid_game1) {Game.new(1, 4)}
    let(:invalid_game2) {Game.new(55, 4)}

      it 'returns true when given a valid combination' do
        expect(valid_game1.valid_params?).to eq(true)
        expect(valid_game2.valid_params?).to eq(true)
      end
      it 'returns false when given an invalid combination' do
        expect(invalid_game1.valid_params?).to eq(false)
        expect(invalid_game2.valid_params?).to eq(false)
      end
    end
  end
