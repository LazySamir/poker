require './lib/game.rb'
require './lib/deck.rb'
game = Game.new(3, 4)
game.deal_cards
game.score_hands

game.hand_scores

game.declare_winner
