require './lib/game.rb'
require './lib/deck.rb'
game = Game.new(2, 4)
game.deal_cards
game.score_hands
