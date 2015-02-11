def englishWrap input
	# If it's zero, dont bother doing anything.
	if (input.to_i == 0)
		return 'zero'
	# If its more than 1000, it goes to the large side first to be broken down
	elsif (input.to_i >= 1000)
		temp = ''
		#The running index for bigNum and bigUnits
		y = 0 	
		engNumLarge input, temp, y
	# If its small enough, just convert it
	elsif (input.to_i < 1000)
		temp = ''
		engNumSmall input, temp
	end
end

def engNumSmall number, tempString
# First, take out the hundreds and name them, pushing to the string
# Then, check whats left, name it, and push to string
# Announce the string at the end, so pass the value along
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
# Figure out how big the number is first, in order of thousands
# Each recursive loop checks the next order
# When found, send that order to engSmallNum
# If theres anything left, keep going until there's < 1000
	bigNums = [' trillion',' billion',' million',' thousand'] 
	bigUnits = [1000000000000, 1000000000, 1000000, 1000] 
	left = number.to_i

	while (left >= bigUnits[y].to_i)
		write = (left / bigUnits[y].to_i)
		left = left - (write * bigUnits[y].to_i)
		if (write > 0)
			tempString = ((engNumSmall write, tempString) + bigNums[y]).to_s
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
while (true)
	number = gets.chomp
	if (number.to_s.downcase == 'quit')
		break
	end
	
	isNegative = ''
	if (number.to_i < 0)
		isNegative = 'Negative '
		number = number.to_i.abs
	end
	
	puts
	puts 'Your number in english would be "' + (isNegative + (englishWrap number).to_s).capitalize + '"'
	puts 'Enter another number, or type Quit to end program.'
end
puts
puts 'Done!' 