require 'sinatra'
require 'sinatra/reloader'

secret = (1 + rand(99)).to_s
puts secret

get '/' do
	final_guess = false

	if secret.to_i + 5 < params["guess"].to_i 
		guess = "Way TOO HIGH"
	elsif secret.to_i - 5 > params["guess"].to_i 
		guess = "Way TOO Low"
	elsif secret.to_i > params["guess"].to_i
		guess = "TOO Low"
	elsif secret.to_i < params["guess"].to_i
		guess = "Too HIGH"
	elsif secret.to_i == params["guess"].to_i
		guess = "You got it!"
		final_guess = true
	end

	if final_guess == true
		right_or_wrong = true
	end

	erb :index, :locals => {:number => secret, :guess => guess, :correct => final_guess, :right_or_wrong => right_or_wrong}
end