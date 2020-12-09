module DayFive
	Cols = 8
	Rows = 128

	def self.partition(rng, l)
		midpoint = rng.begin + ((rng.end - rng.begin) / 2)

		case l
		when "F", "L"
			rng.begin..midpoint
		when "B", "R"
			midpoint.succ..rng.end
		else
			raise "unknown letter #{l}"
		end
	end

	def self.grid(input)
		rows = 0..127
		cols = 0..7

		input.split("").each do |l|
			rows = partition(rows, l) if %w( F B ).include?(l)
			cols = partition(cols, l) if %w( L R ).include?(l)
		end

		[rows.begin, cols.begin]
	end

	def self.run(input)
		row, col = grid(input)
		row * 8 + 5
	end
end
