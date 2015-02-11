def prime_finder (times = 10001)
	known_primes = [2, 3]
	number = 5

	while (known_primes.length < times)	  # looking for this many prime numbers....
	is_prime = true
		known_primes.each do |prime|	  # Check the current number against each known prime number
			next if (!is_prime)
			next if (number == prime)
			if (number % prime == 0) 	  # If it has a factor from any prime, skip it
				is_prime = false
			end
		end
		if (is_prime) 
			known_primes.push(number) 
			puts "\##{known_primes.length} = #{number}"
		end
		number += 2
	end
	return known_primes.last
end

puts prime_finder (10001) # How many primes to find, sequentially starting from 2.
