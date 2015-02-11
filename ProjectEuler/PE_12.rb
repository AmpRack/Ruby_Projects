def number_of_factors(number)
	factors = 0
	sqrt = Math.sqrt(number)
	x = 1

	while (x <= sqrt)
		if (number % x == 0)
			factors += 2
		end
		x += 1
	end
	
	if (sqrt * sqrt == number)
		factors -= 1
	end
	return factors
end

number = 0
x = 0
number_of_factors = 0

while (number_of_factors(number) < 500)
	x += 1
	number += x
	puts "number = #{number} x = #{x} factors = #{number_of_factors(number)}"
end

puts 
puts "#############"
puts number
puts x