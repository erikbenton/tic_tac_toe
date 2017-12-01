class Player
	attr_accessor :piece_type, :wins, :losses

	def initialize(piece_type, wins=0, losses=0)
		@piece_type = piece_type.upcase
		@wins=wins
		@losses=losses
	end

	def make_a_move(row, col, board)
		board.add_piece(self.piece_type, row, col)		
	end

end