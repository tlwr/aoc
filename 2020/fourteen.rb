module DayFourteen
	def self.run(input)
		mask, *mem_sets = input.lines.map(&:strip)

		mask = mask.split(/\s+/).last
		set_mask = mask.gsub("X", "0").to_i(2)
		unset_mask = mask.gsub("X", "1").to_i(2)

		mem_sets.reduce({}) do |mem, l|
			var, eq, val = l.split(/\s+/)
			var = var[/\d+/].to_i
			mem[var] = (val.to_i | set_mask) & unset_mask
			mem
		end.values.sum
	end
end
