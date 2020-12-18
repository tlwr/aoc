require "minitest/autorun"

require_relative "fifteen"

describe DayFifteen do
	it "passes" do
		_(DayFifteen.run).must_equal 436
	end
end
