require './lib/game_start'

RSpec.describe GameStart do
  it 'exists' do
    player_board = Board.new
    computer_board = Board.new
    game_start = GameStart.new(player_board, computer_board)

    expect(game_start).to be_instance_of(GameStart)
  end
end
