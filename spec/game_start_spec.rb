require './lib/game_start'

RSpec.describe GameStart do
  it 'exists' do
    board = Board.new
    game_start = GameStart.new(board)

    expect(game_start).to be_instance_of(GameStart)
  end
end
