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

  def valid_placement?(ship, coordinates_taken)
    valid_length?(ship, coordinates_taken) && valid_consecutive?(ship, coordinates_taken) && valid_empty_space?(coordinates_taken)
  end

  def valid_empty_space?(coordinates_taken)
    coordinates_taken.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def place(ship, coordinates_taken)
    coordinates_taken.each do |coordinate|
      @cells.each do |key, values|
        if key == coordinate
          values.place_ship(ship)
        end
      end
    end
  end

  def render(show = false)
    "  1 2 3 4 \n" +
     "A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n" +
     "B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n" +
     "C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n" +
     "D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n"
  end

  def valid_length?(ship, coordinates_taken)
    ship.length == coordinates_taken.length
  end

  def valid_consecutive?(ship, coordinates_taken)
    valid_horizontal_consecutive?(ship, coordinates_taken) || valid_vertical_consecutive?(ship, coordinates_taken)
  end

  def valid_horizontal_consecutive?(ship, coordinates_taken)
    grid_horizontal = LETTERS.map do |letter|
      NUMBERS.map do |number|
        letter + number
      end
    end
    valid_horizontal = []
    grid_horizontal.each do |row|
      row.each_cons(ship.length) do |coordinates|
        valid_horizontal << coordinates
      end
    end
    valid_horizontal.any? do |valid_array|
      valid_array == coordinates_taken
    end
  end

  def valid_vertical_consecutive?(ship, coordinates_taken)
    grid_vertical = NUMBERS.map do |number|
        LETTERS.map do |letter|
          letter + number
      end
    end
    valid_vertical = []
    grid_vertical.each do |column|
      column.each_cons(ship.length) do |coordinates|
        valid_vertical << coordinates
      end
    end
    valid_vertical.any? do |valid_array|
      valid_array == coordinates_taken
    end
  end
end
