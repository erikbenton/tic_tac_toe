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
		return true if check_rows(type)
		return true if check_cols(type)
		return true if check_diags(type)
		return false
	end

	def check_rows(type)
		isThereWinner = false

		self.board.pieces.each do |row|
			isThereWinner = row.reduce(true) { |isRowWinner, entry| isRowWinner && (entry == type) }
			if(isThereWinner)
				return isThereWinner
			end
		end

		return isThereWinner
	end

	def check_cols(type)
		isThereWinner = false

		(0...self.board.side_length).each do |col|
			isThereWinner = self.board.pieces.reduce(true) { |isColWinner, entry| isColWinner && (entry[col] == type) }
			if(isThereWinner)
				return isThereWinner
			end
		end

		isThereWinner	
	end

	def check_diags(type)
		isThereWinner = false

		side_length = self.board.side_length

		isThereWinner = (0...side_length).reduce(true) { |isDiag1Winner, ind| isDiag1Winner && (self.board.pieces[ind][ind] == type)}
		isThereWinner = isThereWinner || (0...side_length).reduce(true) { |isDiag2Winner, ind| isDiag2Winner && (self.board.pieces[ind][side_length-1-ind] == type)}

		isThereWinner
	end

	def player_prompt(player)
		loop do
			puts "Please enter in a row and column to put your piece"
			input = gets.chomp
			input = input.split()
			row = input[0].to_i
			col = input[1].to_i
			madeMove = player.make_a_move(row, col, self.board)
			if(!madeMove)
				puts "That spot is not available, try again"
			end
			break if(madeMove)
		end
	end

	def reset_game
		
	end

end

game = Game.new("X", "O")

isGameOver = false

game.board.draw_board

while(!isGameOver)
	game.player_prompt(game.player_one)
	game.board.draw_board
	isGameOver = game.check_for_win(game.player_one.piece_type)
end