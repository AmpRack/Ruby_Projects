M = 'land'
o = 'water'

world = [[o,o,o,o,o,o,o,o,o,o,o],
		 [o,o,o,o,M,M,o,o,o,o,o],
		 [o,o,o,o,o,o,o,o,M,M,o],
		 [o,o,o,M,o,o,o,o,o,M,o],
		 [o,o,o,M,o,M,M,o,o,o,o],
		 [o,o,o,o,M,M,M,M,o,o,o],
		 [o,o,o,M,M,M,M,M,M,M,o],
		 [o,o,M,M,M,o,M,M,M,o,o],
		 [o,o,o,o,o,o,M,M,o,o,o],
		 [o,M,o,o,o,M,o,o,o,o,o],
		 [o,o,o,o,o,M,M,o,o,o,o]]

def continentSize world, x, y
	if x < 0 || x > 10
		return 0
	elsif y < 0 || y > 10
		return 0
	end

	if world[y][x] != 'land'
		return 0
	end

	size = 1
	world[y][x] = 'counted land'

	size = size + continentSize(world, x-1, y-1)
	size = size + continentSize(world, x , y-1)
	size = size + continentSize(world, x+1, y-1)
	size = size + continentSize(world, x-1, y )
	size = size + continentSize(world, x+1, y )
	size = size + continentSize(world, x-1, y+1)
	size = size + continentSize(world, x , y+1)
	size = size + continentSize(world, x+1, y+1)

	size
end

puts continentSize(world, 5, 5)