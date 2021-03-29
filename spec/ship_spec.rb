require './lib/ship'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
  end

  it 'has attributes' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.health).to eq(3)
    expect(cruiser.length).to eq(3)
  end

  it 'has sunk?' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
  end
  
  it 'can take a hit and lose health' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it 'can take another hit and lose more health and has not sunk' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit

    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'has no more health and has sunk' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to eq(true)
  end
end