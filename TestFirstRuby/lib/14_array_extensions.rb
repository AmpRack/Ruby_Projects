class Array
	def sum 
		answer = 0
		self.each do |x|
			answer += x
		end
		answer		
	end

	def square 
		answer = []
		self.each do |x|
			answer << x * x
		end
		answer		
	end

	def square!
		self.each do |x|
			self[x-1] *= self[x-1]
		end
		self		
	end
end
