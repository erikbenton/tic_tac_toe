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

	def check_for_win

	end
end

game = Game.new("X", "O")

game.board.draw_board

while(1)
	game.player_prompt(game.player_one)
	game.board.draw_board
	game.player_prompt(game.player_two)
	game.board.draw_board
end