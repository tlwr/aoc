module DayThirteen
	def self.parse_tt(input)
		header, *body = input.lines

		buses = header
			.gsub("bus ", "")
			.split(/\s+/)
			.drop(1)
			.map { |b| b.to_i }

		departures = {}

		body.each do |row|
			cells = row.split(/\s+/)
			time, *marks = cells

			marks.each_with_index do |m, i|
				if m == "D"
					bus = buses[i]
					departures[bus] ||= []
					departures[bus] << time.to_i
				end
			end
		end

		departures
	end

	def self.run(tt, input)
		time = input.lines.first.to_i

		tt = parse_tt(tt)

		bus_id = dt = nil

		tt.each do |bus, departures|
			t = departures.sort.find { |d| d >= time }

			unless t.nil?
				dt = t
				bus_id = bus
			end
		end

		(dt - time) * bus_id
	end
end
