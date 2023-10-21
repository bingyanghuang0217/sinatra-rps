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




get '/rock' do
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_outcome('rock', @computer_choice)
  erb :rock
end

get '/paper' do
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_outcome('paper', @computer_choice)
  erb :paper
end

get '/scissors' do
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_outcome('scissors', @computer_choice)
  erb :scissors
end

def determine_outcome(player, computer)
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
