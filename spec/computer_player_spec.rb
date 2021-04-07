require './lib/computer_player'

RSpec.describe ComputerPlayer do
  it 'exists' do
    board = Board.new
    computer_player = ComputerPlayer.new(board)

    expect(computer_player).to be_instance_of(ComputerPlayer)
  end
end
