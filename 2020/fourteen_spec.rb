require "minitest/autorun"

require_relative "fourteen"

describe DayFourteen do
	let(:input) do
		<<~INPUT
		mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
		mem[8] = 11
		mem[7] = 101
		mem[8] = 0
		INPUT
	end

	it "passes" do
		_(DayFourteen.run(input)).must_equal 165
	end
end
