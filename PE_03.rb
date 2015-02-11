def get_prime_factors (number)
	factor_list = []
	x = 2
	while (number >= x)

		if (number % x == 0)
			puts x 
			factor_list.push(x)
			number = (number / x)
		end
		x += 1
	end
	return factor_list.last
end

#puts get_prime_factors(13195)
#puts get_prime_factors(22567)
puts get_prime_factors(600851475143)




