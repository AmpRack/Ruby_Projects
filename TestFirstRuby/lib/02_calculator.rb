def add (first_num, second_num)
	first_num + second_num
end

def subtract (first_num, second_num)
	first_num - second_num
end

def sum (input_array)
	x = 0 
	answer = 0
	while (x < input_array.length)
		answer += input_array[x]
		x += 1
	end
	answer
end

def multiply (*numbers)
	x = 0
	answer = 1
	while (x < numbers.length)
		answer *= numbers[x]
		x +=1
	end
	answer		
end

def power (base, exponent)
	x = 0
	answer = 1	
	while (x < exponent)
		answer *= base
		x += 1
	end
	answer
end

def factorial (number)
	answer = 1
	x = 0
	if (number > 1)
		while (number > 1)
			answer *= number
			number -= 1
		end
  	end
  	answer
end
