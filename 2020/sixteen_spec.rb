require "minitest/autorun"

require_relative "sixteen"

describe DaySixteen do
	let(:input) do
		<<~INPUT
		class: 1-3 or 5-7
		row: 6-11 or 33-44
		seat: 13-40 or 45-50

		your ticket:
		7,1,14

		nearby tickets:
		7,3,47
		40,4,50
		55,2,20
		38,6,12
		INPUT
	end

	it "passes" do
		_(DaySixteen.run(input)).must_equal 71
	end
end
