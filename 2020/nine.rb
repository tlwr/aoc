module DayNine
	def self.run(input)
		numbers = input
			.lines
			.map(&:strip)
			.map(&:to_i)

		preamble_size = 5
		inputs = numbers.take(preamble_size)
		candidates = numbers.drop(preamble_size)

		until candidates.empty? do
			inputs = inputs.last(preamble_size)
			candidate = candidates.shift

			combinations = inputs.combination(2)
			sums = combinations.map(&:sum)

			return candidate unless sums.include?(candidate)

			inputs << candidate
		end

		raise "Unbroken"
	end
end
