require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess, number)
  erb :index, :locals => {:message => message}
end


def check_guess(guess, number)
  # require 'pry'; binding.pry
  diff = guess - number
  if diff > 5
    "Way too high!"
  elsif guess < number
    "Too low!"
  elsif guess > number
    "Too high!"
  elsif diff < 5 && diff > 0
    "Way too low!"
  elsif guess == number
    "You got it right!\nThe SECRET NUMBER  is #{number}"
  end
end
