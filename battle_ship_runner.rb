require './lib/board'
require './lib/game_start'

player_board = Board.new
computer_board = Board.new
game_start = GameStart.new(player_board, computer_board)
game_start.main_menu
