require 'sinatra/base'
require 'sinatra/flash'
require './lib/game.rb'
require './lib/deck.rb'

class Poker < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/game' do
    erb(:setup)
  end

  post '/game' do
    # Creates an instance of Game using params as arguments.
    no_players = params[:players]
    handsize = params[:cards]

    session[:game] = Game.new(no_players, handsize)

    if session[:game].valid_params?
      redirect(:result)
    else
      flash[:notice] = "Invalid combination of players and handsize"
      redirect(:game)
    end
  end

  get '/result' do
    @game = session[:game]
    @game.deal_cards
    @game.score_hands
    erb(:game)
  end

 run! if app_file == $0
end
