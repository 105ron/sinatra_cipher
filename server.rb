require 'sinatra'
require 'sinatra/reloader'
require_relative 'caesar_split'
get '/' do
	to_cypher,shift = params["encrypt"],params["shift"]
	to_cypher,shift = check_input(to_cypher,shift)
	response = CaesarCipher.encrypt(to_cypher, shift)
  erb :index, :locals => {:response => response}
end

def check_input(cypher, shift)
	if cypher == "" || cypher == nil
		cypher = "Did you forget something?"
	end
	if shift == "" || shift == nil
		shift = 0
	end
	shift = shift.to_i
	return cypher, shift
end
