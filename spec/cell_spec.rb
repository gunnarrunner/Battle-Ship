require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("A1")

    expect(cell).to be_instance_of(Cell)
  end

  it 'has a coordinate' do
    cell = Cell.new("A1")

    expect(cell.coordinate).to eq("A1")
  end

  it 'has a ship in cell' do
    cell = Cell.new("A1")

    expect(cell.ship).to eq(nil)
  end

  it 'does not have a ship in cell' do
    cell = Cell.new("A1")
    
    expect(cell.empty?).to eq(true)
  end

  it 'places a ship and the cell has a ship' do
    cell = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)

  end

  it 'has not been fired upon' do
    cell = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)
  end

  it 'can shoot and be fired upon with the ship losing health' do
    cell = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  it 'can render an empty cell' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it 'can place palce a ship on a cell and see if it has fired upon' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
  end
  
  it 'can render a ship that is hidden' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render(true)).to eq("S")
  end

  it 'can fire upon and render a hit on a ship' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)
  end

  it 'can fire upon and render sink a ship' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cell_2.fire_upon
    cell_2.fire_upon

    expect(cell_2.render).to eq("X")
    expect(cruiser.sunk?).to eq(true)
  end
end
