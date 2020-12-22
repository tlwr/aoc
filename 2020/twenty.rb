require "matrix"

module DayTwenty
	def self.parse(input)
		input
			.split("\n\n")
			.map do |tile_str|
				tile, *rest = tile_str.lines.map(&:strip)

				tile = tile[/\d+/].to_i

				rest = Matrix[*rest
					.join("")
					.split("")
					.each_slice(10)
				]

				[tile, rest]
			end
	end

	def self.common_edges(m1, m2)
		m1_sides = []

		m1_sides << m1.row(0)
		m1_sides << Vector[*m1.row(0).to_a.reverse]
		m1_sides << m1.row(9)
		m1_sides << Vector[*m1.row(9).to_a.reverse]

		m1_sides << m1.column(0)
		m1_sides << Vector[*m1.column(0).to_a.reverse]
		m1_sides << m1.column(9)
		m1_sides << Vector[*m1.column(9).to_a.reverse]

		m2_sides = []

		m2_sides << m2.row(0)
		m2_sides << Vector[*m2.row(0).to_a.reverse]
		m2_sides << m2.row(9)
		m2_sides << Vector[*m2.row(9).to_a.reverse]

		m2_sides << m2.column(0)
		m2_sides << Vector[*m2.column(0).to_a.reverse]
		m2_sides << m2.column(9)
		m2_sides << Vector[*m2.column(9).to_a.reverse]

		m1_sides.each do |m1_side|
			m2_sides.each do |m2_side|
				return true if m1_side == m2_side
			end
		end

		false
	end

	def self.run(input)
		mapping = parse(input)

		good_mappings = []

		mapping
			.permutation(9)
			.each do |permuted_mapping|
				common = true

				horizontal_checks = [
					[0, 1], [1, 2],
					[3, 4], [4, 5],
					[6, 7], [7, 8],
				]

				horizontal_checks.each do |c1, c2|
					m1 = permuted_mapping[c1].last
					m2 = permuted_mapping[c2].last

					common = false unless common_edges(m1, m2)
				end

				vertical_checks = [
					[0, 3], [1, 4], [2, 5],
					[3, 6], [4, 7], [5, 8],
				]

				vertical_checks.each do |c1, c2|
					m1 = permuted_mapping[c1].last
					m2 = permuted_mapping[c2].last

					common = false unless common_edges(m1, m2)
				end

				good_mappings << permuted_mapping if common
			end

		return good_mappings
			.first
			.map(&:first)
			.values_at(0, 2, 6, 8)
			.inject(:*)
	end
end
