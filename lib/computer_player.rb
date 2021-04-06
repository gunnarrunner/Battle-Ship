require './lib/ship'
require './lib/board'

class ComputerPlayer
  attr_reader :board

  def initialize(board)
    @board = board
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def computer_board
  #   placement = []
  #   @board.cells.keys.each_cons(cruiser.length) do |coordinates|
  #     placement << coordinates
  end

  def total_valid_cruiser
    grid_cruiser_horizontal = Board::LETTERS.map do |letter|
      Board::NUMBERS.map do |number|
        letter + number
      end
    end
    valid_cruiser_horizontal = []
    grid_cruiser_horizontal.each do |row|
      row.each_cons(@cruiser.length) do |coordinates|
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
      column.each_cons(@cruiser.length) do |coordinates|
        valid_cruiser_vertical << coordinates
      end
    end
    total_valid_cruiser = valid_cruiser_horizontal + valid_cruiser_vertical
  end

  def total_valid_submarine
    grid_submarine_horizontal = Board::LETTERS.map do |letter|
      Board::NUMBERS.map do |number|
        letter + number
      end
    end
    valid_submarine_horizontal = []
    grid_submarine_horizontal.each do |row|
      row.each_cons(@submarine.length) do |coordinates|
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
      column.each_cons(@submarine.length) do |coordinates|
        valid_submarine_vertical << coordinates
      end
    end
    total_valid_submarine = valid_submarine_horizontal + valid_submarine_vertical
  end
end
