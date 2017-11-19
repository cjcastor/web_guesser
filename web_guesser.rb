require 'sinatra'
require 'sinatra/reloader'

def check_guess(guess, number)
  guess = guess.to_i
  case
  when guess - 5 > number then return "Way too high!"
  when guess > number then return "Too high!"
  when guess + 5 < number then return "Way too low!"
  when guess < number then return "Too low!"
  when guess == number then return "You got it!"
  else return guess
  end
end

number = rand(101)

get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end
