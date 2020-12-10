module DaySeven
	Node = Struct.new(:bag_name, :inner_bags)

	def self.run(input)
		desired_bag = "shiny gold"

		lines = input
			.lines
			.map(&:strip)
			.map { |l| l.tr(".", "") }
			.map { |l| l.gsub(/bag(s)?/, "") }

		contains_desired = {}
		mapping = lines.reduce({}) do |mapping, line|
			outer_bag, inner_bags = line.strip.split(" contain ", 2)

			outer_bag = outer_bag.gsub(/s$/, "").strip

			mapping[outer_bag] = []
			next mapping if inner_bags == "no other"

			inner_bags = inner_bags
				.split(", ")
				.map(&:strip)
				.map { |bag| bag.gsub(/^\d+ /, "") }

			mapping[outer_bag] = inner_bags
			contains_desired[outer_bag] = true if inner_bags.include?(desired_bag)
			mapping
		end

		mapping.each do |outer_bag, inner_bags|
			next if contains_desired[outer_bag]
			contains_desired[outer_bag] = mapping[outer_bag].any? do |inner_bag|
				contains_desired[inner_bag]
			end
		end

		contains_desired.values.count { |contains_desired| contains_desired == true }
	end
end
