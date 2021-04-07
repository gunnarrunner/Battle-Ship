require './lib/ship'
require './lib/board'

class ComputerPlayer
  attr_reader :board,
              :computer_shots

  def initialize(board)
    @board = board
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_shots = @board.cells.keys
    place_computer_ships
  end

  def generate_board(show = false)
    board.render(show)
  end

  def place_computer_ships
    place_computer_cruiser
    place_computer_submarine
  end

  def place_computer_cruiser
    cruiser_placement = total_valid_cruiser.sample
    if @board.valid_placement?(@computer_cruiser, cruiser_placement)
      board.place(@computer_cruiser, cruiser_placement)
    else
      place_computer_cruiser
    end
  end

  def place_computer_submarine
    submarine_placement = total_valid_submarine.sample
     if @board.valid_placement?(@computer_submarine, submarine_placement)
      board.place(@computer_submarine, submarine_placement)
    else
      place_computer_submarine
    end
  end

  def total_valid_cruiser
    grid_cruiser_horizontal = Board::LETTERS.map do |letter|
      Board::NUMBERS.map do |number|
        letter + number
      end
    end
    valid_cruiser_horizontal = []
    grid_cruiser_horizontal.each do |row|
      row.each_cons(@computer_cruiser.length) do |coordinates|
        valid_cruiser_horizontal << coordinates
      end
    end

    grid_cruiser_vertical = Board::NUMBERS.map do |number|
        Board::LETTERS.map do |letter|
          letter + number
      end
    end
    valid_cruiser_vertical = []
    grid_cruiser_vertical.each do |column|
      column.each_cons(@computer_cruiser.length) do |coordinates|
        valid_cruiser_vertical << coordinates
      end
    end
    total_valid_cruiser = valid_cruiser_horizontal + valid_cruiser_vertical
    total_valid_cruiser
  end

  def total_valid_submarine
    grid_submarine_horizontal = Board::LETTERS.map do |letter|
      Board::NUMBERS.map do |number|
        letter + number
      end
    end
    valid_submarine_horizontal = []
    grid_submarine_horizontal.each do |row|
      row.each_cons(@computer_submarine.length) do |coordinates|
        valid_submarine_horizontal << coordinates
      end
    end

    grid_submarine_vertical = Board::NUMBERS.map do |number|
        Board::LETTERS.map do |letter|
          letter + number
      end
    end
    valid_submarine_vertical = []
    grid_submarine_vertical.each do |column|
      column.each_cons(@computer_submarine.length) do |coordinates|
        valid_submarine_vertical << coordinates
      end
    end
    total_valid_submarine = valid_submarine_horizontal + valid_submarine_vertical
    total_valid_submarine
  end
end
