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
    @board_computer = ComputerPlayer.new(@computer_board)
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
      @board_computer
      @board_computer.generate_board
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
      play_game
    else
      puts "INVALID PLACEMENT PLEASE TRY AGAIN!"
      puts "Input must be two consectuive spaces!"
      input_submarine
    end
  end

  def play_game
    until computer_ships_sunk == true || player_ships_sunk == true
      player_shoot
      computer_shot
      puts computer_board.render(true)
      puts player_board.render(true)
    end
    end_game
  end

  def player_shoot
    check_shot_valid(gets.chomp.upcase)
  end

  def check_shot_valid(guess)
    if @computer_board.valid_coordinate?(guess) && @computer_board.cells[guess].fired_upon? == false
      @computer_board.cells[guess].fire_upon
    else
      puts "INVALID PLACEMENT PLEASE TRY AGAIN!"
      puts "Input must be a single valid space!"
      puts "Or space has ALREADY been fired on!! PLZ refer to board"
      player_shoot
    end
  end

  def end_game
    p "hi;)"
  end

  def computer_shot
    guess = @board_computer.computer_shots.sample
    @player_board.cells[guess].fire_upon
    @board_computer.computer_shots.delete(guess)
  end

  def computer_ships_sunk
    computer_cells = @computer_board.cells.values.find_all do |cell|
      cell.ship
    end
    computer_cells.all? do |cell|
      cell.ship.sunk? == true
    end
  end

  def player_ships_sunk
    player_cells = @player_board.cells.values.find_all do |cell|
      cell.ship
    end
    player_cells.all? do |cell|
      cell.ship.sunk? == true
    end
  end
end
