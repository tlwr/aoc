require "minitest/autorun"

require_relative "three"

describe "day three" do
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

	it "traverses the gradient" do
		succ(0, 0).must_equal [3, 1]
		succ(3, 1).must_equal [6, 2]
		succ(1, 1).must_equal [4, 2]
	end

	it "finds trees" do
		tree?(parse(input), 0, 0).must_equal false
		tree?(parse(input), 2, 0).must_equal true
		tree?(parse(input), 3, 0).must_equal true
		tree?(parse(input), 4, 0).must_equal false

		tree?(parse(input), 0, 1).must_equal true
		tree?(parse(input), 1, 1).must_equal false
		tree?(parse(input), 2, 1).must_equal false
		tree?(parse(input), 3, 1).must_equal false
		tree?(parse(input), 4, 1).must_equal true
	end

	it "passes" do
		day_three(input).must_equal 7
	end
end
