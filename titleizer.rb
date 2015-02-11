def titleize (input)
	# These are words that don't need to be capitalized in the end...
	# but they DO need to be capitalized here. Add more words here, as needed.
	small_words = ['And','But','Or','The','A','An','At','To','Of','Over']
	y = 0
	
	words = input.split							# Break the string into an array
	x = 1				
	
	answer = ''
	answer += words[0].capitalize 				# Always capitalize the first word				

	while (x < words.length)					# Check all other words, one at a time
		y = 0
		words[x] = words[x].capitalize 			# Capitalize each word as it comes in
		while (y < small_words.length)			# Scan through the small_words
			if (words[x] == small_words[y])		# If there's a match...
				words[x] = words[x].downcase	# down case it...
				y = small_words.length			# And get out of the loop, to move to the next input word	
			else									
				y += 1							# Otherwise, check the next small_word					
			end
		end										# After the small_word list is searched,
		answer << " #{words[x]}"				# Push the updated word into the answer
		x += 1									# Then look for the next input word
	end
	answer												
end

puts titleize("jaws")
puts titleize("david copperfield")
puts titleize("the bridge over the river kwai")
puts titleize("through the sands of the hour glass")
puts titleize("and so are the days of our lives.")