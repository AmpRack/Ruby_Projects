def get_prime_sum (max_num)
	primelist = [2 ,3]  # Declare these two because we want to ignore 1
	number = 5			# Start at 5, since it's the next confirmed prime number.
	answer = 5			# Also starts at 5, since its the sum of the first 2 elements.

	while (number <= max_num)
		last_prime = primelist.last
		is_prime = true
		primelist.each do |prime|	  # Check the current number against each known prime number
			next if (!is_prime)
			next if (number == prime)
			if (number % prime == 0) 	  # If it has a factor from any prime, skip it
				is_prime = false
			end
		end

		if (is_prime) 
			primelist.push(number)
			answer += number
			puts "\##{primelist.length} = #{number}, current sum = #{answer}"
		end

		number += 2 # This isn't the fast option. It just works.
	end
	return answer
end

puts get_prime_sum(2000000)