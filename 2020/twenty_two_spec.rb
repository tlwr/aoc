require "minitest/autorun"

require_relative "twenty_two"

describe DayTwentyTwo do
	let(:input) do
		<<~INPUT
		Player 1:
		9
		2
		6
		3
		1

		Player 2:
		5
		8
		4
		7
		10
		INPUT
	end

	it "passes" do
		_(DayTwentyTwo.run(input)).must_equal 306
	end
end
