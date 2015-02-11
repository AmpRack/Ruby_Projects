wordlist = []
sortlist = []
index = 0

puts
puts 'How many words would you like to sort?'
wordcount = gets.chomp
if (wordcount.to_i < 1)
    while (wordcount < 1)
        puts 'Can\'t sort ' + wordcount + ' words! Please try again!'
        wordcount = gets.chomp
    end
end

while (index < wordcount.to_i)
    puts 'Enter any word you want! ' + (wordcount.to_i - index.to_i).to_s  + ' words remaining.'
    wordlist[index] = gets.chomp
    index = index + 1
end

def arraySort (unsortedArray, sortedArray)
	if unsortedArray.length <= 0
		return
	end
	x = 0
	y = 0
	while (y < unsortedArray.length)
		if (unsortedArray[x].to_s.downcase < unsortedArray[y].to_s.downcase)
			y +=  1
		elsif (unsortedArray[x].to_s.downcase > unsortedArray[y].to_s.downcase)
			x = y
			y += 1
		else
			y += 1
		end
	end
	sortedArray.push(unsortedArray[x])
	unsortedArray.delete(unsortedArray[x])
	arraySort unsortedArray, sortedArray
end

arraySort wordlist, sortlist

puts
puts 'Here are you words, sorted!'
puts '---------------------------'
puts sortlist
puts '---------------------------'
puts 'Done!'
