require './lib/module_format'
require './lib/ship'
require './lib/computer_player'
class GameStart

  include Format

  attr_reader :player_board,
              :computer_board,
              :player_cruiser,
              :player_submarine,
              :computer_last_shot,
              :player_guess

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @board_computer = ComputerPlayer.new(@computer_board)
    @computer_last_shot = nil
    @player_guess = nil
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    line_break
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
      line_break
      receive_input
    end
  end

  def place_ships
    line_break
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "Good Luck ;)"
    line_break
    puts "             * Player 1 Board! *"
    puts player_board.render(true)
    line_break
    puts "Enter the squares for the Cruiser (3 spaces):"
    line_break
    input_cruiser
  end

  def input_cruiser
    check_cruiser_valid(gets.chomp.upcase)
  end

  def check_cruiser_valid(user_input)
    player_cruiser = user_input.split
    if @player_board.valid_placement?(@player_cruiser, player_cruiser)
      player_board.place(@player_cruiser, player_cruiser)
      line_break
      puts puts "             * Player 1 Board with the Cruiser! *"
      puts player_board.render(true)
      line_break
      puts "Enter the squares for the Submarine (2 spaces):"
      line_break
      input_submarine
    else
      line_break
      puts "INVALID PLACEMENT PLEASE TRY AGAIN!"
      puts "Input must be three consectuive spaces!"
      line_break
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
      line_break
      puts "             * Player 1 Board with both ships!! *"
      puts player_board.render(true)
      line_break
      puts "Board is set!!"
      line_break
      puts "Please choose your coordinate to fire on!"
      line_break
      play_game
    else
      puts "INVALID PLACEMENT PLEASE TRY AGAIN!"
      puts "Input must be two consectuive spaces!"
      line_break
      input_submarine
    end
  end

  def play_game
    puts "====================COMPUTER BOARD====================="
    puts computer_board.render(true)
    until computer_ships_sunk == true || player_ships_sunk == true
      puts "Please select the next coordinate to fire on!!"
      player_shoot
      computer_shot
      puts "====================COMPUTER BOARD====================="
      puts computer_board.render(true)
      line_break
      computer_feedback
      puts "=====================PLAYER BOARD======================"
      puts player_board.render(true)
      line_break
      player_feedback
      line_break
    end
    end_game
  end

  def player_shoot
    check_shot_valid(gets.chomp.upcase)
  end

  def check_shot_valid(guess)
    @player_guess = guess
    if @computer_board.valid_coordinate?(guess) && @computer_board.cells[guess].fired_upon? == false
      @computer_board.cells[guess].fire_upon
    else
      puts "====================COMPUTER BOARD====================="
      puts computer_board.render(true)
      line_break
      puts "INVALID PLACEMENT PLEASE TRY AGAIN!"
      puts "Input must be a single valid space!"
      puts "OR space has ALREADY been fired on!! PLZ refer to board"
      line_break
      player_shoot
    end
  end

  def end_game
    if player_ships_sunk == true
      puts "HAHA LOSER! I won!!"
    else
      puts "IMPOSSIBLE........ you... you beat me!!"
    end
    line_break
    puts "Do you dare play again??"
    puts "Enter p to play. Enter q to quit."
    receive_end_input
  end

  def receive_end_input
    end_credits(gets.chomp.downcase)
  end

  def end_credits(input)
    if input == "p" || input == "play"
      load 'battle_ship_runner.rb'
      # @board_computer
      # @board_computer.generate_board
      # place_ships
    elsif input == "q" || input == "quit"
      puts "I knew you didn't have the GUTS ;)"
      exit
    else
      puts "Invalid input!"
      puts "Would you like to (p)lay or (q)uit?"
      receive_end_input
    end
  end

  def computer_feedback
    if @board_computer.board.cells[@player_guess].render(false) == "X"
      puts "Your shot on #{@player_guess} sunk my battleship!!"
    elsif @board_computer.board.cells[@player_guess].render(false) == "H"
      puts "Your shot on #{@player_guess} hit my battleship!!"
    elsif @board_computer.board.cells[@player_guess].render(false) == "M"
      puts "Your shot on #{@player_guess} was a miss!!"
    end
  end

  def player_feedback
    if @player_board.cells[@computer_last_shot].render(false) == "X"
      puts "My shot on #{@computer_last_shot} sunk your battleship!!"
    elsif @player_board.cells[@computer_last_shot].render(false) == "H"
      puts "My shot on #{@computer_last_shot} hit your battleship!!"
    elsif @player_board.cells[@computer_last_shot].render(false) == "M"
      puts "My shot on #{@computer_last_shot} was a miss!!"
    end
  end

  def computer_shot
    guess = @board_computer.computer_shots.sample
    @computer_last_shot = guess
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