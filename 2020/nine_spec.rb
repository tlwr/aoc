require "minitest/autorun"

require_relative "nine"

describe DayNine do
	let(:input) do
		<<~INPUT
		35
		20
		15
		25
		47
		40
		62
		55
		65
		95
		102
		117
		150
		182
		127
		219
		299
		277
		309
		576
		INPUT
	end

	it "passes" do
		_(DayNine.run(input)).must_equal 127
	end
end
