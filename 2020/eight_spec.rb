require "minitest/autorun"

require_relative "eight"

describe DayEight do
	let(:input) do
		<<~INPUT
		nop +0
		acc +1
		jmp +4
		acc +3
		jmp -3
		acc -99
		acc +1
		jmp -4
		acc +6
		INPUT
	end

	it "passes" do
		_(DayEight.run(input)).must_equal 5
	end
end
