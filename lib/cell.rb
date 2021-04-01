class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    ship == nil
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if fired_upon == true && @ship != nil
      ship.hit
    else
      return @fired_upon
    end
  end

  def render(show = nil)
    if fired_upon? == false && @ship != nil && show == true
      "S"
    elsif fired_upon? == true && @ship != nil && @ship.sunk?
      "X"
    elsif fired_upon? == true && @ship != nil
      "H"
    elsif fired_upon? == true && @ship == nil
      "M"
    else fired_upon? == false
      "."
    end
  end
end
