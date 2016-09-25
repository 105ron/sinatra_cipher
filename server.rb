require 'sinatra'
require 'sinatra/reloader'
require_relative 'caesar_split'
get '/' do
	to_cypher = params["encrypt"]
	response = CaesarCipher.encrypt(to_cypher, 3) unless to_cypher == nil
  erb :index, :locals => {:response => response}
end



