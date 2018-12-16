require 'sinatra/base'

class Poker < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/game' do
    erb(:setup)
  end

  post '/game' do
    # set params
    redirect(:game)
  end

  get '/result' do
    # shows players, cards and who wins
    erb(:game)
  end

 run! if app_file == $0
end
