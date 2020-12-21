module DayNineteen
	def self.run(input)
		lines = input
			.lines
			.map(&:strip)

		candidates = lines
			.reject { |l| l.match?(/^\d+:/) }
			.reject(&:empty?) 

		rules = lines
			.select { |l| l.match?(/^\d+:/) }
			.map do |l|
				num = l[/^\d+:/].tr(":", "")
				raw_rule = l[/: .*/].sub(": ", "")

				rule = raw_rule
					.split(/\s+/)
					.map do |tok|
						case
						when tok.match?(/^\d+$/)
							tok.to_i
						when tok.match?(/^"[a-z]+"$/i)
							tok.tr('"', "")
						when tok == "|"
							:or
						end
					end

				if rule.include?(:or)
					rule = [:or] + rule
							.slice_when { |t| t == :or }
							.map { |g| g.delete(:or) ; g }
							.map { |g| [:sequence] + g }

				elsif rule.count == 1 && rule.first.is_a?(String)
					rule = [:literal, rule.first]

				else
					rule = [:sequence] + rule
				end

				[num.to_i, rule]
			end
			.to_h

		t, rule = rules.first
		tree = parse(rules, rules[0])

		valid_candidates = candidates
			.map { |c| [c, match(tree, [c])] }
			.to_h

		valid_candidates.values.count { |c| c.include?("") }
	end

	def self.parse(rules, rule)
		return rule if rule.is_a?(String)
		return rule if rule.is_a?(Symbol)
		return parse(rules, rules[rule]) if rule.is_a?(Numeric)

		rule.map do |sr|
			case
			when sr.is_a?(Numeric)
				parse(rules, rules[sr])
			when sr.is_a?(Array)
				sr.map { |ssr| parse(rules, ssr) }
			else
				sr
			end
		end
	end

	def self.match(rule, strs)
		op, *args = rule

		case op
		when :literal 
			return strs
				.select { |str| str.start_with? args.first }
				.map { |str| str.sub(args.first, "") }

		when :sequence
			args.each do |seq_rule|
				strs = match(seq_rule, strs)
			end

			return strs
		when :or
			or_strs = []

			args.each do |or_rule|
				or_strs += match(or_rule, strs)
			end

			return or_strs
		else
			raise "Unknown op #{op}"
		end
	end
end
