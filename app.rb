require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

post '/play' do
  player_choice = params['choice']
  computer_choice = ['rock', 'paper', 'scissors'].sample

  result = determine_winner(player_choice, computer_choice)

  erb :result, locals: { player_choice: player_choice, computer_choice: computer_choice, result: result }
end

def determine_winner(player, computer)
  return 'It\'s a draw!' if player == computer

  case player
  when 'rock'
    computer == 'scissors' ? 'You win!' : 'Computer wins!'
  when 'paper'
    computer == 'rock' ? 'You win!' : 'Computer wins!'
  when 'scissors'
    computer == 'paper' ? 'You win!' : 'Computer wins!'
  end
end

