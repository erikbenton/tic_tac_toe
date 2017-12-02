require_relative "Player.rb"
require_relative "Board.rb"

class Game
	attr_accessor :board, :player_one, :player_two

	def initialize(player_one_type, player_two_type, board_side=3)
		@player_one = Player.new(player_one_type)
		@player_two = Player.new(player_two_type)
		@board = Board.new(board_side)
	end

	def start_game

	end

	def check_for_win(type)
		puts type
		check_rows(type)
		check_cols(type)
	end

	def check_rows(type)
		isThereWinner = false
		isRowWinner = true

		self.board.pieces.each do |row|
			isThereWinner = row.reduce(isRowWinner) { |isRowWinner, entry| isRowWinner && (entry == type) }
			if(isThereWinner)
				return isThereWinner
			end
		end

		return isThereWinner
	end

	def check_cols(type)
		isThereWinner = false
		isColWinner = true

		(0...self.board.side_length).each do |col|
			isThereWinner = self.board.pieces.reduce(isColWinner) { |isColWinner, entry| isColWinner && (entry[col] == type) }
			if(isThereWinner)
				return isThereWinner
			end
		end

		isThereWinner	
	end


# WORKING ON THIS ONE
	def check_diags(type)
		isThereWinner = false
		isDiag1Winner = true
		isDiag2Winner = true

		isThereWinner = (0...self.board.side_length).reduce(isDiag1Winner) { |isDiag1Winner, ind| isDiag1Winner && (self.board.pieces[ind][ind] == type)}

	def player_prompt(player)
		puts "Please enter in a row and column to put your piece"
		input = gets.chomp
		input = input.split()
		row = input[0].to_i
		col = input[1].to_i
		player.make_a_move(row, col, self.board)
	end

	def reset_game
		
	end

end

game = Game.new("X", "O")

game.board.draw_board

while(1)
	game.player_prompt(game.player_one)
	game.board.draw_board
	if(game.check_for_win(game.player_one.piece_type))
		puts "Winner!"
		return
	end
	game.player_prompt(game.player_two)
	game.board.draw_board
	if(game.check_for_win(game.player_two.piece_type))
		puts "Winner!"
		return
	end
end