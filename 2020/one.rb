def day_one(input)
	input
		.lines
		.map(&:to_i)
		.combination(2)
		.find { |a, b| a + b == 2020 }
		.inject(:*)
end
