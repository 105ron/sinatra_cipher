require 'sinatra'
require 'sinatra/reloader'
require_relative 'caesar_split'
get '/' do
	to_cypher,shift = params["encrypt"],params["shift"]
	to_cypher = check_input(to_cypher)
	response = CaesarCipher.encrypt(to_cypher, shift.to_i)
  erb :index, :locals => {:response => response}
end

def check_input(cypher)
	if cypher == ""
		cypher = "You should put your text in the field before clicking submit"
	end
	return cypher
end
