def englishWrap input
	# If it's zero, dont bother doing anything.
	if (input.to_i == 0)
		return 'zero'
	# If its more than 1000, it goes to the large side first to be broken down
	elsif (input.to_i >= 1000)
		temp = ''
		y = 0
		engNumLarge input, temp, y
	# If its small enough, just convert it
	elsif (input.to_i < 1000)
		temp = ''
		engNumSmall input, temp
	end
end

def engNumSmall number, tempString
	ones = ['one','two','three','four','five','six','seven','eight','nine']
	teens =['ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
	tens = ['twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']

	left = number.to_i
	write = left / 100
	left = left - write * 100
	
	if (write > 0)
		tempString += (ones[(write.to_i - 1)] + " hundred")
		if (left > 0)
			tempString += (' and ')
		end
	end
	
	if (left != 0)
		write = left / 10
		left = left - write * 10
		if (write == 1)
			tempString += (teens[left.to_i].to_s)
			left = 0
		elsif (write >= 2 && left > 0)
			tempString += (tens[(write.to_i - 2)] + '-' + ones[(left.to_i - 1)])
		elsif (write >= 2 && left == 0)
			tempString += tens[(write.to_i - 2)]
		else 
			tempString += (ones[(left - 1)])
		end
	end
	tempString
end

def engNumLarge number, tempString, y
	bigNums = [' trillion',' billion',' million',' thousand'] 
	bigUnits = [1000000000000, 1000000000, 1000000, 1000] 
	left = number.to_i
	
	while (left >= bigUnits[y].to_i)
		write = (left / bigUnits[y].to_i)
		left = left - (write * bigUnits[y].to_i)
		if (write > 0)
			puts write
			tempString = ((engNumSmall write, tempString) + bigNums[y]).to_s
			puts tempString
			if (left > 0)
				tempString += (', ')
				engNumLarge left, tempString, y
			end
		end
	end
	if (y < 3 && left != 0)
		y += 1
		engNumLarge left, tempString, y
	elsif (y == 3 && left != 0)
		engNumSmall left, tempString
	end
end

puts 'Please enter any number you want!'
number = gets.chomp
if (number.to_i < 0)
	number = number.to_i.abs
end
lastBeer = 's'

while (number.to_i > 0)
	bottles = (englishWrap number).to_s.capitalize
	puts bottles + ' bottle' + lastBeer + ' of beer on the wall,'
	puts bottles + ' bottle' + lastBeer + ' of beer,'
	puts 'You take one down and pass it around,'
	number = number.to_i - 1
	if number == 1
		lastBeer = ''
	elsif number == 0
		lastBeer = 's'
	end
	bottles = (englishWrap number).to_s
	puts 'And there\'s ' + bottles + ' bottle' + lastBeer + ' of beer on the wall!'
	puts
	puts
end
puts 'Done!' 