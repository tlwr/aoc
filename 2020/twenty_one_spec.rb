require "minitest/autorun"

require_relative "twenty_one"

describe DayTwentyOne do
	let(:input) do
		<<~INPUT
		mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
		trh fvjkl sbzzf mxmxvkd (contains dairy)
		sqjhc fvjkl (contains soy)
		sqjhc mxmxvkd sbzzf (contains fish)
		INPUT
	end

	it "passes" do
		_(DayTwentyOne.run(input)).must_equal 5
	end
end
