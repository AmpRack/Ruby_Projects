# Get path for music files
puts 'Please input the full path to your music folder:'
	musicPath = gets.chomp
	if musicPath.include? "\\"			# Flip the slashes around
		musicPath.gsub!("\\", '/')
		musicPath.chomp('/')
	end

# Get name for finished playlist file
puts "\nPlease input the name of the finished playlist:"
	playlistName = gets.chomp
	playlistName += '.m3u'

# If yes(true), output list will be shuffled. 
# If no(false), list will be Alphabetized by path
puts "\nWould you like to shuffle this list? Yes/No"
	shuffle = false
	askShuffle = gets.chomp
	while (askShuffle.downcase != 'yes' && askShuffle.downcase != 'y' && askShuffle.downcase != 'no' && askShuffle.downcase != 'n')
		puts 'I didn\'t understand that, please type Yes or No.'
		askShuffle = gets.chomp
	end
	if (askShuffle.downcase == 'y' || askShuffle.downcase == 'yes')
		shuffle = true
	end

# First, look for files of these extensions
# Since extensions are case-sensitive, get the 3 most common variants
filetypes = ['mp3','mp4','wma','ogg','wav','mid']			
allFiletypes = '' #Empty String, holds permutations of filetypes[]
x = 0
while x < filetypes.length
	allFiletypes += filetypes[x].downcase + ',' + filetypes[x].upcase + ',' + filetypes[x].capitalize
	x += 1
	if x < filetypes.length
		allFiletypes += ','
	end
end

# Read-in path/songs to filenames[y]
filenames = Dir["#{musicPath}/**/*.{#{allFiletypes}}"]
puts "Processing files from #{musicPath} (#{filenames.length} found)\n"

# Write array to file
#####################
####### NOTE ########
#####################
# Need to fix the counter here, so it wont run forever!
File.open playlistName, 'w' do |f|
y = 0 										# =>  Index for filenames[], each holds a path/song
	while (y < filenames.length)			# While we're not at the end of the array...
		if (shuffle == true)
			y = rand(filenames.length - 1)	# If we're shufflin', just pick a random y
		end

		filenames[y].gsub!('/','\\')    # Flip the slashes around...
		f.write (filenames[y] + "\n")   # Write to file...
		filenames.delete(y)				# Remove the entry from the list of songs
		y += 1					   		# And load the next line

	end	
end

puts "Playlist #{playlistName} created"
puts "Done! Display #{playlistName} now? Yes/No"
	displayPlaylist = gets.chomp
	if (displayPlaylist.downcase == 'y' || displayPlaylist.downcase == 'yes')
		puts 'This feature hasn\'t been added yet.'
	end
