def echo (input)
	input
end

def shout (input)
	input.upcase
end

def repeat (input, times = 2)
	answer = (input + ' ') * times
	answer.chomp(' ')
end

def start_of_word (input, amount)
	input[0..(amount - 1)]
end

def first_word (input)
	input.split[0]
end

def titleize (input)
	# Add any other words you want, but they need to be capitalized here to work right.
	small_words = ['And','But','Or','The','A','An','At','To','Of','Over']
	words = input.split
	answer = ''

	words.each_with_index do |word, i|
		y = 0
		word = word.capitalize 					# Start each word capitalized

		if (i == 0) then answer << word + ' '	# Ignore the first word, it should always be capitalized
		
		else
			while (y < small_words.length)		# Look through small_words for a match
				if (word == small_words[y])
					word = word.downcase		# If word is a small_word, force to downcase
				else 
					y += 1
				end
			end
			answer << word + ' '
		end
	end
	answer.chomp(' ')
end