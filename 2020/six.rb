module DaySix
	def self.parse_groups(input)
	end

	def self.run(input)
		input
			.split(/\n{2,}/).map(&:chomp)
			.map { |s| s.gsub(/\s/m, "").split("").uniq.length }
			.inject(:+)
	end
end
