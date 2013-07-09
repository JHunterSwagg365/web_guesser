require 'sinatra'
require 'sinatra/reloader'

x = (1 + rand(99)).to_s


get '/' do
	"The secret number is #{x}"
end