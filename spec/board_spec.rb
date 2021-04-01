require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it 'exists' do
     board = Board.new

    expect(board).to be_instance_of(Board)
  end
  it "has cells" do
    board = Board.new

  end
end
