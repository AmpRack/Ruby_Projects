class Temperature
	attr_accessor :f, :c

	def initialize (temps = {})
		@temp = temps
	end

	def in_fahrenheit
		if (@temp[:c])
			self.ctof
		else
			@temp[:f]
		end
	end

	def in_celsius
		if (@temp[:f])
			self.ftoc
		else
			@temp[:c]
		end
	end

	def self.from_fahrenheit (input)
		Temperature.new(:f => input)
	end

	def self.from_celsius (input)
		Temperature.new(:c => input)
	end

	def ctof
		@temp[:f] = (@temp[:c] * (9.0/5.0) + 32.0)
	end
	
	def ftoc
		@temp[:c] = ((@temp[:f] - 32.0) * (5.0/9.0))
	end
end

class Celsius < Temperature
	def initialize (input)
		super(:c => input)
	end

end

class Fahrenheit < Temperature
	def initialize (input)
		super(:f => input)
	end
end
