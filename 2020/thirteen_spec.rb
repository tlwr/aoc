require "minitest/autorun"

require_relative "thirteen"

describe DayThirteen do
	let(:tt) do
		<<~INPUT
		time   bus 7   bus 13  bus 59  bus 31  bus 19
		929      .       .       .       .       .
		930      .       .       .       D       .
		931      D       .       .       .       D
		932      .       .       .       .       .
		933      .       .       .       .       .
		934      .       .       .       .       .
		935      .       .       .       .       .
		936      .       D       .       .       .
		937      .       .       .       .       .
		938      D       .       .       .       .
		939      .       .       .       .       .
		940      .       .       .       .       .
		941      .       .       .       .       .
		942      .       .       .       .       .
		943      .       .       .       .       .
		944      .       .       D       .       .
		945      D       .       .       .       .
		946      .       .       .       .       .
		947      .       .       .       .       .
		948      .       .       .       .       .
		949      .       D       .       .       .
		INPUT
	end

	let(:input) do
		<<~INPUT
		939
		7,13,x,x,59,x,31,19
		INPUT
	end

	it "parses the timetable" do
		_(DayThirteen.parse_tt(tt)[13]).must_equal [936, 949]
	end

	it "passes" do
		_(DayThirteen.run(tt, input)).must_equal 295
	end
end
