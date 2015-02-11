def collatz (max_num)
	most_steps = 0
	ms_num = 0

	max_num.times do |current_num|
		steps = 0
		current_num += 1
		start_num = current_num
		while (current_num > 1)
			if (current_num % 2 == 0)
				current_num /= 2
			else
				current_num = (3 * current_num) + 1
			end
			steps += 1
		end

		if (steps > most_steps)
			most_steps = steps
			ms_num = start_num
			puts most_steps.to_s + ' steps for #' + start_num.to_s
		end
	end
	return ms_num
end

puts collatz(999999)

