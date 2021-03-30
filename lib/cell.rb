class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
  end

  def empty?
    cell.ship = true
  end

end
