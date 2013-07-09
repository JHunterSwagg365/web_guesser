require 'sinatra'
require 'sinatra/reloader'

secret = (1 + rand(99)).to_s


get '/' do

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
	end

	erb :index, :locals => {:number => secret, :guess => guess}
end