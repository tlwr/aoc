require "minitest/autorun"

require_relative "one"

describe "day one" do
	let(:input) do
		<<~INPUT
		1721
		979
		366
		299
		675
		1456
		INPUT
	end

	it "passes" do
		day_one(input).must_equal 514579
	end
end
