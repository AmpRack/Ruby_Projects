answer = 0
1000.times do |x|
	if (x % 3 == 0) || (x % 5 == 0)
		answer += x
	end
end
puts answer