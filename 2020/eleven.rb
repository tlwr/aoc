module DayEleven
	class Ferry
		attr_reader :map

		def initialize(map)
			@map = map
		end

		def occupied_seats
			map.split("").select { |c| c == "#" }
		end

		def ==(other)
			map == other.map
		end

		def each_seat
			10.times do |y|
				10.times do |x|
					yield x, y, map[(y * 10) + x]
				end
			end
		end

		def neighbours(x, y)
			n = [
				[x-1, y-1],
				[x,   y-1],
				[x+1, y-1],
				[x-1, y],
				[x,   y],
				[x+1, y],
				[x-1, y+1],
				[x,   y+1],
				[x+1, y+1],
			]
				.map { |x, y| [x.clamp(0, 10-1), y.clamp(0, 10-1)] }
				.uniq

			n.delete([x, y])

			n.map { |x, y| map[(y * 10) + x] }
		end

		def next
			next_map = map.dup

			each_seat do |x, y, val|
				n = neighbours(x, y)

				num_neighbour_occ = n.select { |s| s == "#" }.count

				if val == "L" && num_neighbour_occ == 0
					next_map[(y * 10) + x] = "#"
				elsif val == "#" && num_neighbour_occ >= 4
					next_map[(y * 10) + x] = "L"
				end
			end

			Ferry.new(next_map)
		end
	end

	def self.run(input)
		ferry = Ferry.new(
			input
				.lines
				.map(&:strip)
				.join("")
		)

		loop do
			next_ferry = ferry.next

			break if next_ferry == ferry

			ferry = next_ferry
		end

		ferry.occupied_seats.count
	end
end
