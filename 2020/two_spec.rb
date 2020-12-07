require "minitest/autorun"

require_relative "two"

describe "day two" do
	let(:input) do
		<<~INPUT
		1-3 a: abcde
		1-3 b: cdefg
		2-9 c: ccccccccc
		INPUT
	end

	it "parses the input" do
		parse(input).must_equal [
			Policy.new(1..3, "a", "abcde"),
			Policy.new(1..3, "b", "cdefg"),
			Policy.new(2..9, "c", "ccccccccc"),
		]
	end

	it "passes" do
		day_two(input).must_equal 2
	end
end
