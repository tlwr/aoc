module DayFifteen
	def self.run
		turns = [0, 3, 6]

		until turns.length == 2020 do
			turn_number = turns.length + 1
			last_spake = turns.last

			if turns[-2] == turns[-1]
				turns << 1
				next
			end

			if turns.count { |t| t == last_spake } == 1
				turns << 0
				next
			end

			last_seen_indices = []
			turns.each_with_index do |t, i|
				last_seen_indices << i if t == last_spake
			end

			last_two_indices = last_seen_indices[-2..-1]
			turns << last_two_indices.last - last_two_indices.first
		end

		turns.last
	end
end
