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
  end
end
