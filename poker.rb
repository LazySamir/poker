require 'sinatra/base'
require './lib/game.rb'
require './lib/deck.rb'

class Poker < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/game' do
    erb(:setup)
  end

  post '/game' do
    # create game with params
    no_players = params[:players]
    handsize = params[:cards]
    session[:game] = Game.new(no_players, handsize)
    redirect(:result)
  end

  get '/result' do
    @game = session[:game]
    @game.deal_cards
    @game.score_hands
    # shows players, cards and who wins
    erb(:game)
  end

 run! if app_file == $0
end
