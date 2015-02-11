def get_c (a, b)
	c_squared = (a**2) + (b**2)
	c = Math.sqrt(c_squared).to_i
	return c
end

a = 1
b = 1
answer_found = false

while (!answer_found)
	c = get_c(a, b)
	if (a**2 + b**2 == c**2) && (a + b + c == 1000)
		answer_found = true
	else
		if (b > 1000)
			b = 1
			if (a < 1000)
				a += 1
			else # For error catching
				puts 'A has gone out of bounds! A=' + a.to_s + ' B=' + b.to_s + ' C=' + c.to_s
				answer_found = true
			end
		elsif (b <= 1000)
			b += 1
		end
	end
end

puts (a * b * c)
puts 'A=' + a.to_s + ' B=' + b.to_s + ' C=' + c.to_s