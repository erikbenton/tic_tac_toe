class Board
	attr_accessor :pieces, :number_of_pieces, :side_length

	def initialize(side_length=3)
		@pieces = [[" "," "," "],
							 [" "," "," "],
							 [" "," "," "]]
		@side_length = side_length
		@number_of_pieces = 0;

	end

	def add_piece(piece_type, row, col)
		@pieces[row-1][col-1] = piece_type
		@number_of_pieces += 1;
	end

	def draw_board
		puts ""
		(0...@side_length).each {|row| draw_row(row)}
		puts ""
	end

	def draw_spacer
		@pieces[row].each do |entry|
			print "| #{entry} "
		end
	end

	def draw_row(row)
		@pieces[row].each do |entry|
			print "| #{entry} "
		end
		puts "|"
	end

end