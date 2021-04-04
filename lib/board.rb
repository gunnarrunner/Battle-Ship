require './lib/cell'
class Board
  attr_reader :cells

  LETTERS = ["A", "B", "C", "D"]
  NUMBERS = ["1", "2", "3", "4"]

  def initialize
    @cells = {}
    generate_board
  end

  def generate_board
    LETTERS.each do |letter|
      NUMBERS.each do |number|
        @cells[letter + number] = Cell.new(letter + number)
      end
    end
  end

  def valid_coordinate?(cell_location)
    @cells.values.any? do |cell|
      cell.coordinate == cell_location
    end
  end

  def valid_length?(ship, coordinates_taken)
    ship.length == coordinates_taken.length
  end

  def valid_consecutive?(ship, coordinates_taken)
    row_1 = @cells.keys[0..3]
    row_2 = @cells.keys[4..7]
    row_3 = @cells.keys[8..11]
    row_4 = @cells.keys[12..15]
    valid = []
    row_1.each_cons(ship.length) { |coordinates| valid << coordinates}
    row_2.each_cons(ship.length) { |coordinates| valid << coordinates}
    row_3.each_cons(ship.length) { |coordinates| valid << coordinates}
    row_4.each_cons(ship.length) { |coordinates| valid << coordinates}
    # rows = [row_1, row_2, row_3, row_4]
    require "pry"; binding.pry
    # horizantal_range = @cells.[1..4]
    # horizantal_range.each_cons(ship.length) do |
  end

  # def valid_diagonal?(ship, coordinates_taken)
    
  # e
  def valid_placement?(ship, coordinates_taken)
    valid_length?(ship, coordinates_taken) && valid_consecutive?(ship, coordinates_taken)
  end

end

   
# rows = {row_1 => [@cells.keys[0..3]], row_2  => [@cells.keys[4..7]], row_3 => @cells.keys[8..11], row_4 => @cells.keys[12..15]}
