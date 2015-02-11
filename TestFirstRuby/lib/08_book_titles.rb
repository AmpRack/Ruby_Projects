class Book
	attr_accessor :title

	def title 
		# These words get downcased, but need to be capitalized here to work properly
		small_words = ['The','A','An','And','But','Or','At','To','Of','Over','In']
		@answer = @title.split[0].capitalize + ' '


		@title.split.each_with_index do |word, i|
			next if (i == 0)
			word = word.capitalize
			small_words.each do |small_word|
				if (word == small_word)
					word = word.downcase
				end
			end
			@answer << word + ' '
		end
		@answer.chomp(' ')
	end
end