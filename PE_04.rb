# This is a great way to check for palindromes
def palindrome_check(input)
	temp_ar = input.to_s.split(//)
	while ((temp_ar.length / 2) >= 1)
		if (temp_ar.first == temp_ar.last)
			last = temp_ar.length - 2
			temp_ar = temp_ar[1..last]
		else
			return false
		end
	end
	return true
end

# This is just to cycle through 999 * 999, looking for palindromic products
def num_cycler
	products = []

	999.times do |z|
		x = 999 - z
		y = 999
		next if (x < 100)
		while (y > 99)
			if (palindrome_check(x * y))
				puts 'x=' + x.to_s + ' y=' + y.to_s
				products.push(x * y)
			end
			y -= 1
		end
	end
	return products.sort.last
end

puts num_cycler
