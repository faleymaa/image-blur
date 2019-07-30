class Image

	def initialize(grid)
		@grid = grid
	end

	def output_image
		puts @grid.map(&:join)
	end

	def blur!(distance=1)
	    distance.times do
	      blur_coords!
	    end
  	end

	private

	def blur_coords!
      	blur_coords = []
		@grid.each_with_index do |row, i|
        	row.each_with_index do |x, row_i|
         		blur_coords << [i, row_i] if x == 1
        	end
      	end

		blur_coords.each do |coord|
			@grid[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @grid[coord[0]].length - 1
			@grid[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
			@grid[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @grid.length - 1
			@grid[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
		end
	end
end
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur!(2)
image.output_image
