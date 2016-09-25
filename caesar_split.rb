class CaesarCipher

	def self.encrypt(user_string, cipher_shift)
		cipher_shift = check_shift(cipher_shift) #Check value is within 26 to prevent errors
		caesar_cipher(user_string, cipher_shift) #encrypt
	end
	
	private

	def self.caesar_cipher(user_string, cipher_shift)
	  for i in 0..user_string.length
		  if /\w/ === user_string[i] #alphanumeric characters not including whitespace
		    ord_number = user_string[i].ord
				if ord_number >= 97 && ord_number <= 122      #lowercase letters
				  ord_number += cipher_shift
				  ord_number -= 26 if ord_number > 122
				  ord_number += 26 if ord_number < 97
				elsif ord_number >= 65 && ord_number <= 90   #uppercase letters
				  ord_number += cipher_shift
				  ord_number -= 26 if ord_number > 90
				  ord_number += 26 if ord_number < 65
				end
		  user_string[i] = ord_number.chr
			end
		end
		user_string
	end

	def self.check_shift(cipher_shift)
		#A recursive method for making sure shift range within +/- 26
		if cipher_shift > 26
			cipher_shift -= 26
			check_shift(cipher_shift)
		elsif cipher_shift < -26
			cipher_shift += 26
			check_shift(cipher_shift)
		else
			return cipher_shift
		end
	end

end
#puts "Input string to encrypt..."
#text_to_cipher = gets.chomp
#puts "Input cipher offset..."
#cipher_offset = gets.chomp
#puts caesar_cipher(text_to_cipher, cipher_offset.to_i)
puts CaesarCipher.encrypt("Hello there", 111)