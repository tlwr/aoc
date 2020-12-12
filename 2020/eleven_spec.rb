require "minitest/autorun"

require_relative "eleven"

describe DayEleven do
	let(:input) do
		<<~INPUT
		L.LL.LL.LL
		LLLLLLL.LL
		L.L.L..L..
		LLLL.LL.LL
		L.LL.LL.LL
		L.LLLLL.LL
		..L.L.....
		LLLLLLLLLL
		L.LLLLLL.L
		L.LLLLL.LL
		INPUT
	end

	it "passes" do
		_(DayEleven.run(input)).must_equal 37
	end
end
