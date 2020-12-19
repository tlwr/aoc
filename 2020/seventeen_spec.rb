require "minitest/autorun"

require_relative "seventeen"

describe DaySeventeen do
	let(:input) do
		<<~INPUT
		.#.
		..#
		###
		INPUT
	end

	it "computes neighbours correctly" do
		neighbours = DaySeventeen::Cell.new(0, 0, 0).neighbours
		_(neighbours.count).must_equal 3 ** 3 - 1
	end

	it "passes" do
		_(DaySeventeen.run(input)).must_equal 112
	end
end
