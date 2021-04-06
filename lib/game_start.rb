require './lib/ship'
class GameStart
  attr_reader :board

  def initialize(board)
    @board = board
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
      # instanciate the computer class and render their board
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
    puts board.render
    #board.place
  end
end
