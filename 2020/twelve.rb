module DayTwelve
	class Ferry
		attr_reader :lat, :long

		def initialize
			@lat = @long = 0
			@deg = 90
		end

		def move(input)
			op, arg = input
				.match(/^([A-Z])([0-9]+)/)
				.captures
			arg = arg.to_i

			case op
			when "N"
				@lat += arg
			when "S"
				@lat -= arg
			when "E"
				@long += arg
			when "W"
				@long -= arg
			when "L"
				@deg -= 90
				@deg %= 360
			when "R"
				@deg += 90
				@deg %= 360
			when "F"
				case @deg
				when 0
					@lat += arg
				when 90
					@long += arg
				when 180
					@lat -= arg
				when 270
					@long -= arg
				else
					raise "Unknown deg #{@deg}"
				end
			else
				raise "Unknown op #{op}"
			end
		end
	end

	def self.run(input)
		instructions = input
			.lines
			.map(&:strip)

		f = Ferry.new

		instructions.each do |i|
			f.move(i)
		end

		f.lat.abs + f.long.abs
	end
end
