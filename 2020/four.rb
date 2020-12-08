module DayFour
	K = %i(ecl pid eyr hcl byr iyr hgt) # no cid

	def self.parse(input)
		input
			.split(/^$/)
			.map do |group|
				h = group
					.strip
					.split(/\s+/)
					.map { |s| s.split(":", 2) }
					.to_h
					.transform_keys(&:to_sym)
			end
		
	end

	def self.run(input)
		parse(input)
			.reject { |h| h.values_at(*K).select(&:nil?).empty? }
			.count
	end
end
