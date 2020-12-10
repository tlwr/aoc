require "set"

module DayEight
	def self.run(input)
		instructions = input
			.lines
			.map(&:strip)
			.map { |l| l.split(/\s+/) }
			.map { |inst, arg| [inst, arg.to_i] }

		register = instruction_pointer = 0

		visited = Set.new

		while instruction_pointer < instructions.length do
			op, arg = instructions.at(instruction_pointer)

			break if visited.include?(instruction_pointer)
			visited.add instruction_pointer

			case op
			when "nop"
				true
			when "jmp"
				instruction_pointer += arg
			when "acc"
				register += arg
			else
				raise "Unknown instruction #{op} with arg #{arg}"
			end

			instruction_pointer += 1 unless op == "jmp"
		end

		register
	end
end
