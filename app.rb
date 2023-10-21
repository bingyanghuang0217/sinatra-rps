require "sinatra"
require "sinatra/reloader"

get("/") do
  erb :homepage
end

get("/rock") do
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_outcome('rock', @computer_choice)
  erb :rock
end

get('/paper') do
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_outcome('paper', @computer_choice)
  erb :paper
end

get('/scissors') do
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_outcome('scissors', @computer_choice)
  erb :scissors
end

def determine_outcome(player, computer)
  return 'We tied!' if player == computer

  case player
  when 'rock'
    computer == 'scissors' ? 'We won!' : 'We lost!'
  when 'paper'
    computer == 'rock' ? 'We won!' : 'We lost!'
  when 'scissors'
    computer == 'paper' ? 'We won!' : 'We lost!'
  end
end
