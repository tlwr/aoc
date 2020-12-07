module DayTwo
	Policy = Struct.new(:range, :letter, :password) do
		def valid?()
			b = range.begin
			e = range.end

			password
				.split.sort.join
				.match?(/#{letter}{#{b},#{e}}/)
		end
	end

	def self.policy(*args)
		Policy.new(*args)
	end

	def self.parse(input)
		input
			.lines
			.map { |l| l.chomp.split(/ /) }
			.map do |raw_rng, letter, pw|
				r = Range.new(*raw_rng.split("-").take(2).map(&:to_i))

				l = letter.tr(":", "")

				Policy.new(r, l, pw)
			end
	end

	def self.run(input)
		parse(input)
			.select(&:valid?)
			.length
	end
end
