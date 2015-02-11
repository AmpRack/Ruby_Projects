def square_sum
	answer = 0
	nat_sum = 0
	how_many = 100

	(how_many + 1).times do |x|
		next if (x == 0)
		answer += (x ** 2)
		nat_sum += x
		puts "x^2 = #{x ** 2}  nat_sum = #{nat_sum}"
	end
	return ((nat_sum ** 2) - answer)
end

puts square_sum