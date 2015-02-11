sequence = [1, 2] # This is a starter seed for the rest of the sequence
x = 1
next_num = 3
answer = 0

while (next_num < 4000000)
	sequence << next_num
	next_num = (sequence[x] + sequence[x + 1])
	x += 1
end

sequence.each do |number|
	if (number % 2 == 0)
		answer += number
	end
end

puts answer