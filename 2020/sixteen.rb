module DaySixteen
	def self.run(input)
		class_ranges = nil
		row_ranges = nil
		seat_ranges = nil

		input.lines.take(3).each do |line|
			line = line.strip

			ranges = line
				.split(":", 2)
				.last
				.strip
				.split(" or ")
				.map { |f| Range.new(*f.split("-").map(&:to_i)) }

			case line
			when /class:/
				class_ranges = ranges
			when /row:/
				row_ranges = ranges
			when /seat:/
				seat_ranges = ranges
			end
		end

		your_ticket = input
			.lines
			.drop_while { |l| !l.match?(/your ticket/i) }
			.drop(1)
			.take(1)
			.first.split(",").map(&:to_i)

		other_tickets = input
			.lines
			.drop_while { |l| !l.match?(/nearby tickets/i) }
			.drop(1)
			.map { |l| l.strip.split(",").map(&:to_i) }

		invalid = []
		other_tickets.each do |ticket|
			ticket.each do |val|
				next if [
					class_ranges,
					row_ranges,
					seat_ranges,
				].flatten.any? { |rng| rng.include? val }

				invalid << val
			end
		end
		invalid.sum
	end
end
