require "minitest/autorun"

require_relative "nineteen"

describe DayNineteen do
	let(:input) do
		<<~INPUT
		0: 4 1 5
		1: 2 3 | 3 2
		2: 4 4 | 5 5
		3: 4 5 | 5 4
		4: "a"
		5: "b"

		ababbb
		bababa
		abbbab
		aaabbb
		aaaabbb
		INPUT
	end

	def lit(l)
		[:literal, l]
	end

	it "handles literals" do
		_(DayNineteen.match(
			lit("a"),
			["a"],
		)).must_equal [""]
	end

	it "handles sequences" do
		_(DayNineteen.match(
			[:sequence, lit("a"), lit("b"), lit("c")],
			["abc"],
		)).must_equal [""]
	end

	it "handles or" do
		_(DayNineteen.match(
			[:or, [:sequence, lit("a"), lit("b")], [:sequence, lit("a"), lit("c")]],
			["ab"],
		)).must_equal [""]
	end

	it "passes" do
		_(DayNineteen.run(input)).must_equal 2
	end
end
