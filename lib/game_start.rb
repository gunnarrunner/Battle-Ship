require './lib/ship'
require './lib/computer_player'
class GameStart
  attr_reader :player_board, 
              :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
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
    input_cruiser
  end

  def input_cruiser
    check_cruiser_valid(gets.chomp.upcase)
  end

  def check_cruiser_valid(user_input)
    player_cruiser = user_input.split
    if @player_board.valid_placement?(@player_cruiser, player_cruiser) 
      player_board.place(@player_cruiser, player_cruiser)
      puts player_board.render(true)
      puts "Enter the squares for the Submarine (2 spaces):"
      input_submarine
    else
      puts "INVALID PLACEMENT PLEASE TRY AGAIN!"
      puts "Input must be three consectuive spaces!" 
      input_cruiser
    end
  end

  def input_submarine
    check_submarine_valid(gets.chomp.upcase)
  end

  def check_submarine_valid(user_input)
     player_submarine = user_input.split
    if @player_board.valid_placement?(@player_submarine, player_submarine) 
      player_board.place(@player_submarine, player_submarine)
      puts player_board.render(true)
      puts "Board is set!!"
      next_method
    else
      puts "INVALID PLACEMENT PLEASE TRY AGAIN!"
      puts "Input must be two consectuive spaces!" 
      input_submarine
    end
  end

  def next_method
  #  want to shoot at each others board loop until ones 
  #  board of ships are sunk
    require "pry"; binding.pry
  end
end
