require "minitest/autorun"

require_relative "five"

describe DayFive do
	let(:input) { "FBFBBFFRLR" }

	it "partitions rows" do
		_(DayFive.partition(0..127, "F")).must_equal 0..63
		_(DayFive.partition(0..127, "B")).must_equal 64..127

		_(DayFive.partition(0..63, "F")).must_equal 0..31
		_(DayFive.partition(0..63, "B")).must_equal 32..63

		_(DayFive.partition(32..63, "F")).must_equal 32..47
		_(DayFive.partition(32..63, "B")).must_equal 48..63

		_(DayFive.partition(44..45, "F")).must_equal 44..44
		_(DayFive.partition(44..45, "B")).must_equal 45..45
	end

	it "partitions columns" do
		_(DayFive.partition(0..7, "L")).must_equal 0..3
		_(DayFive.partition(0..7, "R")).must_equal 4..7

		_(DayFive.partition(4..7, "L")).must_equal 4..5
		_(DayFive.partition(4..7, "R")).must_equal 6..7

		_(DayFive.partition(4..5, "L")).must_equal 4..4
		_(DayFive.partition(4..5, "R")).must_equal 5..5
	end

	it "determines the grid position" do
		_(DayFive.grid(input)).must_equal [44, 5]
	end

	it "passes" do
		_(DayFive.run(input)).must_equal 357
	end
end
