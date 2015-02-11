class Dictionary

	def initialize
		@words = {} 		# Holds ALL words and definitions
		@found = {}			# Holds/displays results from .find
		@printout = ''		# Holds/displays results from .printable
	end

	def entries 
		@words
	end

	def add (input)
	# Make sure nil definitions stay nil.
		if (input.is_a?(String))
			@temphash = {input.to_s => nil}
			@words.merge!(@temphash)
		else
			@words.merge!(input)
		end
	end

	def keywords
		@words.keys.sort
	end

	def include? (input)
		if (@words.keys.include?(input))
			true
		else
			false
		end
	end

	def find (input)
		@words.each_pair do |word, defn|
			if (word.to_s.include?(input))
				@temphash = {word => defn}
				@found.merge!(@temphash)
			end
		end
		@found
	end

	def printable
		self.keywords.each do |word|
			@temparray = @words.values_at(word)
			@printout += "[#{word}] \"#{@temparray[0]}\"\n"
		end
		@printout.chomp
	end
end