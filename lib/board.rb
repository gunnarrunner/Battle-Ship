class Board
  attr_reader :cells
  def initialize
    @cells = {"A1" => Hash.new("A1"),
              "A2" => Hash.new("A2"),
              "A3" => Hash.new("A3"),
              "A4" => Hash.new("A4"),
              "B1" => Hash.new("B1"),
              "B2" => Hash.new("B2"),
              "B3" => Hash.new("B3"),
              "B4" => Hash.new("B4"),
              "C1" => Hash.new("C1"),
              "C2" => Hash.new("C2"),
              "C3" => Hash.new("C3"),
              "C4" => Hash.new("C4"),
              "D1" => Hash.new("D1"),
              "D2" => Hash.new("D2"),
              "D3" => Hash.new("D3"),
              "D4" => Hash.new("D4")
            }
  end
end
#
