def romanizer integer, romans
	letters = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'] #13 possibilities
	numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]				  #13 here too
	romanCounter = 0

	while integer.to_i > 0
		while integer.to_i < numbers[romanCounter]
			romanCounter = romanCounter + 1
		end
		romans.push letters[romanCounter]
		integer = integer.to_i - numbers[romanCounter].to_i
	end
end

puts

while true
	puts 'Please enter any positive integer.'
	input = gets.chomp
	puts

	while input.to_i < 1
		if (input.to_i < 1)
			puts 'Invalid number! Please enter a positive integer.'
		end
		input = gets.chomp
	end

	while input.to_i > 9999
		if (input.to_i > 9999)
			puts 'Invalid number! Please enter a number less than 10000.'
		end
		input = gets.chomp
	end

	output = []
	romanizer input, output
	puts output.join('')
	puts
	puts 'Try Again? Y/N'
	tryAgain = gets.chomp
	
	if tryAgain.downcase == 'n'
		break
	elsif tryAgain.downcase != 'n' && tryAgain.downcase != 'y'
		puts 'Thats not really Yes or No, but I assume you mean Yes.'
	end
end