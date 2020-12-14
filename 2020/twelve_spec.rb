require "minitest/autorun"

require_relative "twelve"

describe DayTwelve do
	let(:input) do
		<<~INPUT
		F10
		N3
		F7
		R90
		F11
		INPUT
	end

	it "passes" do
		_(DayTwelve.run(input)).must_equal 25
	end
end
