def measure (amount = 1, &block)
	x = 0
	start_time = Time.now
	while (x < amount)
			if (block_given?)
			block.call
			x += 1
		end
	end
	(Time.now - start_time) / amount
end