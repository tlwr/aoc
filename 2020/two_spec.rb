require "minitest/autorun"

require_relative "two"

describe DayTwo do
	let(:input) do
		<<~INPUT
		1-3 a: abcde
		1-3 b: cdefg
		2-9 c: ccccccccc
		INPUT
	end

	it "parses the input" do
		DayTwo.parse(input).must_equal [
			DayTwo.policy(1..3, "a", "abcde"),
			DayTwo.policy(1..3, "b", "cdefg"),
			DayTwo.policy(2..9, "c", "ccccccccc"),
		]
	end

	it "passes" do
		DayTwo.run(input).must_equal 2
	end
end
