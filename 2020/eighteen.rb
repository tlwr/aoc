module DayEighteen
	def self.run(input)
		tokens = []
		intermediate = ""

		input
			.chars
			.each do |c|
				if c == "(" || c == ")"
					if intermediate != ""
						tokens << intermediate.to_i
						intermediate = ""
					end

					case c
					when "("
						tokens << :lparen
					when ")"
						tokens << :rparen
					end
				elsif c == " "
					if intermediate != ""
						tokens << intermediate.to_i
						intermediate = ""
					end
				elsif c == "+"
					tokens << :add
				elsif c == "*"
					tokens << :mult
				else
					intermediate += c
				end
			end

		if intermediate != ""
			tokens << intermediate.to_i
		end

		res, rest = evl(tokens)
		raise rest unless rest.empty?

		res
	end

	def self.evl(tokens)
		return [0, []] if tokens.empty?
		return [tokens.first, []] if tokens.count == 1

		op = nil
		arg = nil

		loop do
			break if tokens.empty?

			token = tokens.shift

			if token.is_a? Numeric
				if arg.nil?
					arg = token
				else
					case op
					when :add
						arg = arg + token
					when :mult
						arg = arg * token
					else
						raise "Unknown op #{op}"
					end

					op = nil
				end
			elsif token == :add || token == :mult
				op = token
			elsif token == :lparen
				subexpr, rest = evl(tokens)
				tokens = rest

				if arg.nil?
					arg = subexpr
				else
					case op
					when :add
						arg = arg + subexpr
					when :mult
						arg = arg * subexpr
					else
						raise "Unknown op #{op}"
					end
				end
			elsif token == :rparen
				return [arg, tokens]
			end
		end

		return [arg, []]
	end
end
