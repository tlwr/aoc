module DayThree
	def self.parse(input)
		input
			.lines
			.map(&:chomp)
			.map { |l| l[/^\S+/].split("") }
	end

	def self.succ(*args)
		x, y, *_ = args
		[x + 3, y + 1]
	end

	def self.tree?(board, x, y)
		board[y][x] == "#"
	end

	def self.run(input)
		x, y = 0, 0
		tree_count = 0

		board = parse(input)

		board.count.times do |line|
			break if y > line
			tree_count += 1 if tree?(board, x, y)

			x, y = *succ(x, y)
		end

		tree_count
	end
end
