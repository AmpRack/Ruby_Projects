# I know this one wasn't required, but one of the exercises I did earlier
# was almost the same thing, so I adapted it to work here. I did have an
# issue where numbers over 1 billion were being changed to Bignums and failing
# the rspec test. I'm using Win7 x64, with the x64 version of Ruby, and the
# code works otherwise, but it still fails for me here. I can't test it
# properly (without bending the rules and using class Integer), but it SHOULD
# still pass the tests and work fine.

class Fixnum

	def in_words
		answer = ''		# Holds the final output string
		
		if (self < 0) then answer << 'negative ' end				# Bonus, but now it works with negative numbers
		if (self.abs == 0) then answer = 'zero'						# If its zero, just say zero
		elsif (self.abs < 1000) then iw_small(self.abs, answer)		# Actually converts numbers to string
		elsif (self.abs >= 1000) then iw_big(self.abs, answer, 0)	# Figures out which 'big unit' name to use
		else answer << 'Something went horribly wrong...' end		# This should never happen, but just in case...
		
		answer.chomp(' ')
	end
	
	def iw_small (input, answer)
		ones = ['','one','two','three','four','five','six','seven','eight','nine']
		teens = ['ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
		tens = ['','','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']

		# First, write out the hundreds spot and remove it.
		to_write = input / 100
		num_remaining = input - (to_write * 100)
		if (to_write > 0) then answer << "#{ones[to_write]} hundred " end

		# For numbers between 1 and 99
		if (num_remaining > 0)
			to_write = num_remaining / 10
			num_remaining = num_remaining - (to_write * 10)
			
			if (to_write >=2 && num_remaining > 0)
				answer << "#{tens[to_write]} #{ones[num_remaining]}"
			elsif (to_write >= 2 && num_remaining == 0)
				answer << "#{tens[to_write]}"
			elsif (to_write == 1)
				answer << "#{teens[num_remaining]}"
				num_remaining = 0
			else 
				answer << "#{ones[num_remaining]}"
			end
		end
	end

	def iw_big (input, answer, u)
		big_units = [' trillion ',' billion ',' million ',' thousand '] 
		big_nums = [1000000000000, 1000000000, 1000000, 1000] 
		num_remaining = input

		# Determine what unit-name to give big numbers
		while (num_remaining >= big_nums[u])
			to_write = num_remaining / big_nums[u]
			num_remaining = num_remaining - (to_write * big_nums[u])

			if (to_write > 0)
				iw_small(to_write, answer)
				answer << big_units[u]
			end
		end

		# Keep trying with all big_nums
		if (u < 3 && num_remaining > 0)
			u += 1
			iw_big(num_remaining, answer, u)
		elsif (u == 3 && num_remaining > 0)
			iw_small(num_remaining, answer)
		end
	end
end