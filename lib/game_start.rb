require './lib/ship'
require './lib/computer_player'
class GameStart
  attr_reader :player_board, 
              :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end

  def main_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    receive_input
  end

  def receive_input
    menu_options(gets.chomp.downcase)
  end

  def menu_options(input)
    if input == "p" || input == "play"
      board_computer = ComputerPlayer.new(@computer_board)
      board_computer.generate_board
      place_ships
    elsif input == "q" || input == "quit"
      puts "I knew you didn't have the GUTS ;)"
      exit
    else
      puts "Invalid input!"
      puts "Would you like to (p)lay or (q)uit?"
      receive_input
    end
  end

  def place_ships
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts player_board.render(true)
    puts "Enter the squares for the Cruiser (3 spaces):"
    # input_ships
  end

  # def input_ships
  #   menu_options(gets.chomp.downcase)
  # end
end
