class Timer
attr_accessor :seconds, :time_string

	def seconds (start = 0)
		start
	end

	def time_string
		@hours = self.padded (@seconds / 3600)
		@mins  = self.padded((@seconds % 3600) / 60)
		@secs  = self.padded((@seconds % 3600) % 60)

		"#{@hours}:#{@mins}:#{@secs}"		
	end

	def padded (input)
		if (input.to_i > 10)
			first  = input.to_i / 10
			second = input.to_i % 10
		else
			first  = 0
			second = input.to_i
		end
		input = "#{first}#{second}"
	end
end
