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
    
    expect(cell.ship).to eq(nil)
  end

end
