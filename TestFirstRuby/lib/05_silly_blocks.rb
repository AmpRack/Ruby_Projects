def reverser 
	words = yield.to_s.split
	answer = ''
	words.each do |word|
		answer << (word.reverse + ' ')
	end
	answer.chomp(' ')
end

def adder (y = 1)	
	yield + y
end

def repeater(z = 1)
	while (z > 0)
		yield
		z -= 1
	end
end