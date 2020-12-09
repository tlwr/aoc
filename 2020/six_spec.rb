require "minitest/autorun"

require_relative "six"

describe DaySix do
	let(:input) do
		<<~INPUT
		abc

		a
		b
		c

		ab
		ac

		a
		a
		a
		a

		b
		INPUT
	end

	it "passes" do
		_(DaySix.run(input)).must_equal 11
	end
end
