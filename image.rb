class Image

	def initialize(grid)
		@grid = grid
	end

	def output_image
		puts @grid.map(&:join)
	end
end