require "minitest/autorun"

require_relative "eighteen"

describe DayEighteen do
	it "passes" do
		[
			"", 0,
			"123", 123,
			"2 * 3 + (4 * 5)", 26,
			"5 + (8 * 3 + 9 + 3 * 4 * 3)", 437,
			"5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))", 12240,
			"((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2", 13632,
		]
			.each_slice(2)
			.each { |expr, answer| _(DayEighteen.run(expr)).must_equal(answer, expr) }
	end
end
