require './lib/board'
require './lib/game_start'

board = Board.new
game_start = GameStart.new(board)
game_start.main_menu
