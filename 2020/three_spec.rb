require "minitest/autorun"

require_relative "three"

describe DayThree do
	let(:input) do
		<<~INPUT
		..##.........##.........##.........##.........##.........##.......  --->
		#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
		.#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
		..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
		.#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
		..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....  --->
		.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
		.#........#.#........#.#........#.#........#.#........#.#........#
		#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
		#...##....##...##....##...##....##...##....##...##....##...##....#
		.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
		INPUT
	end

	let(:parsed) { DayThree.parse(input) }

	it "traverses the gradient" do
		DayThree.succ(0, 0).must_equal [3, 1]
		DayThree.succ(3, 1).must_equal [6, 2]
		DayThree.succ(1, 1).must_equal [4, 2]
	end

	it "finds trees" do
		DayThree.tree?(parsed, 0, 0).must_equal false
		DayThree.tree?(parsed, 2, 0).must_equal true
		DayThree.tree?(parsed, 3, 0).must_equal true
		DayThree.tree?(parsed, 4, 0).must_equal false

		DayThree.tree?(parsed, 0, 1).must_equal true
		DayThree.tree?(parsed, 1, 1).must_equal false
		DayThree.tree?(parsed, 2, 1).must_equal false
		DayThree.tree?(parsed, 3, 1).must_equal false
		DayThree.tree?(parsed, 4, 1).must_equal true
	end

	it "passes" do
		DayThree.run(input).must_equal 7
	end
end
