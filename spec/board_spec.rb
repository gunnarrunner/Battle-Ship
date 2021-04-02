require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it "has valid coordinates" do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'has valid placement' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
  end


end
