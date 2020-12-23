module DayTwentyTwo
	def self.run(input)
		deck1, deck2 = input.split("\n\n")

		deck1 = deck1.lines.map(&:strip).drop(1).map(&:to_i)
		deck2 = deck2.lines.map(&:strip).drop(1).map(&:to_i)

		until deck1.empty? || deck2.empty?
			p1 = deck1.shift
			p2 = deck2.shift

			if p1 < p2
				deck2 << p2
				deck2 << p1
			else
				deck1 << p1
				deck1 << p2
			end
		end

		[deck1, deck2]
			.max_by(&:count)
			.reverse
			.zip(1..10)
			.map { |a, b| a * b }
			.inject(&:+)
	end
end
