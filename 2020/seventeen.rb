module DaySeventeen
	Cell = Struct.new(*%i(x y z)) do
		def ==(o)
			x == o.x && y == o.y && z == o.z
		end

		def neighbours
			ns = []

			(x-1..x+1).each do |nx|
				(y-1..y+1).each do |ny|
					(z-1..z+1).each do |nz|
						n = Cell.new(nx, ny, nz)
						ns << n unless n == self
					end
				end
			end

			ns
		end
	end

	def self.run(input)
		cycles = 0
		cells = Set.new
		
		input.lines.each_with_index do |line, y|
			z = 0
			line.strip.chars.each_with_index do |char, x|
				active = char == "#"
				cells << Cell.new(x, y, z) if active
			end
		end

		until cycles == 6 do
			cycles += 1

			new_cells = Set.new
			scope = Set.new(cells)

			cells.each do |cell|
				scope << cell
				cell.neighbours.map { |n| scope << n }
			end

			scope.each do |cell|
				active = cells.include?(cell)

				active_neighbours = cell
					.neighbours
					.select { |n| cells.include?(n) }

				if active
					new_cells << cell if (2..3).include?(active_neighbours.count)
				else
					new_cells << cell if active_neighbours.count == 3
				end
			end

			cells = new_cells
		end

		cells.count
	end
end
