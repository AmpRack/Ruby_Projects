def translate (input)
	words = input.split					# Input string, broken into words and arrayed
	active_word = ''					# A single word, being checked and manipulated
	x = 0								# Keeps track of what active_word we're on
	vowel = ['a','e','i','o','u']		# Possible vowels
	v = 0 								# Vowel[] index
	punct = ['!',',','.','?',';',':']	# Possible punctuation marks, add to it as needed
	punct_holder = ''					# Hold any punctuations from the end of active_word
	found_vowel = false					# If true, sent modified active_Word to answer.
	answer = ''							# Actual output string

	while (x < words.length)
	### Capitalization Detector
		active_word = words[x]
		if (active_word == active_word.capitalize)			  
			word_is_capital = true
		end

	### Punctuation Extractor
		punct.length.times do |p|							  
			while (active_word[-1] == punct[p])
				punct_holder << active_word[-1]
				active_word = active_word.chomp(active_word[-1])
			end
		end

	### Skip single-vowel words
		if (active_word.downcase == 'a' || active_word.downcase == 'i')	
			found_vowel = true
		end

	### We don't know if we're starting with a vowel or not, but assume we don't.
	### Check the first letter of active_word for any vowels.
	### If yes, add suffix to active_word If no, check the other vowels.
		while (!found_vowel)
			while (v < vowel.length)
				if (active_word[0].downcase == vowel[v])
					active_word << 'ay'
					v = vowel.length
					found_vowel = true
				else
					v += 1
				end
			end

	### If no vowels found at all, move the first letter to the end and try again.
			if (!found_vowel)
				if (active_word[0..1].downcase == 'qu')
					active_word = "#{active_word[2..-1] + 'qu'}"
				else
					first_letter = active_word[0]
					active_word = "#{active_word[1..-1] + first_letter}"
				end				
				v = 0
			end
		end

	### AFter the word is modified, push it into the answer
		if (word_is_capital)
			answer << "#{active_word + punct_holder} ".capitalize	
		else
			answer << "#{active_word + punct_holder} "	
		end

	### Reset necessary variables, then try the next word
		v = 0
		x += 1
		punct_holder = ''
		word_is_capital = false
		found_vowel = false
	end

answer.chomp(' ')
end
puts translate('apple, eggs, Orange and octopodes!')
puts translate('apple, eggs, Orange and banana')