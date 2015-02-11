class RPNCalculator

	def initialize ()
		@problem = []		# Holds the input, as it comes in
		@token = []			# Holds a string, broken into tokens
		@answer = 0			# The solved problem
	end

	def push (input)
		@problem << input
	end

	def value
		@answer
	end

	def plus # Addition
		self.error_check
		@last_index = @problem.length - 1
		@answer = (@problem[@last_index -1].to_i + @problem[@last_index].to_i)
		self.cleanup
	end

	def minus # Subtraction
		self.error_check
		@last_index = @problem.length - 1
		@answer = (@problem[@last_index - 1].to_i - @problem[@last_index].to_i)
		self.cleanup
	end

	def times # Multiplication
		self.error_check
		@last_index = @problem.length - 1
		@answer = (@problem[@last_index - 1].to_f * @problem[@last_index].to_f)
		self.cleanup
	end

	def divide # Division
		self.error_check
		@last_index = @problem.length - 1
		@answer = (@problem[@last_index - 1].to_f / @problem[@last_index].to_f)
		self.cleanup
	end

	def error_check	# Need at least 2 entries in @problem to work
		if (@problem.length == 0 || @problem.length == nil)
			raise "calculator is empty"
		elsif (@problem.length == 1)
			raise "too few values"
		end
	end

	def tokens (input) # Converts string-input into an array
		@temparray = input.split(' ')
		@temparray.each do |x|
			if (x == "+")
				@token << :+
			elsif (x == "-")
				@token << :-
			elsif (x == "*")
				@token << :*
			elsif (x == "/")
				@token << :/
			else
				@token << x.to_i
			end
		end
		@token
	end

	def evaluate (input) # Converts a string into tokens, and then solves
		@eval = self.tokens(input)
		@eval.each do |y|
			if (y == :+)
				self.plus
			elsif (y == :-)
				self.minus
			elsif (y == :*)
				self.times
			elsif (y == :/)
				self.divide
			else
				self.push(y)
			end
		end
		self.value
	end

	def cleanup
		@problem.pop
		@problem.pop
		@problem.push(@answer)
	end
end