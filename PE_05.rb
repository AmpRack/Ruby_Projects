def super_divisible (number)
	is_divisible = true
	20.times do |x|
		next if (!is_divisible)
		next if (x <= 1)
		if (number % (x + 1) == 0)
			is_divisible = true
		else
			is_divisible = false
		end
	end
	return is_divisible
end

def num_cycler
	num_cycles = 0
	y = 2520
	while (!super_divisible(y))
	num_cycles += 1
		puts "\##{num_cycles} = #{y}"
		y += 2520
	end
	return y
end

puts num_cycler