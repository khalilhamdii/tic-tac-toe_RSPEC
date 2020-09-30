# spec/testing.rb
require 'require_all'
require_all './lib'

describe Player.new('khalil', 'X') do
  it { is_expected.to have_attributes(name: 'khalil') }
  it { is_expected.to have_attributes(token: 'X') }
end

describe Board do
  game_board = Board.new
  empty_board = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ]

  it 'Expected to have an empty attribute named board' do
    expect(game_board.board).to eql(empty_board)
  end

  describe '#get_position' do
    it 'Return the content in the position given of the game board' do
      expect(game_board.get_position(1)).to eql(game_board.board[0][0])
    end
  end

  describe '#update_position' do
    it 'Should update the board with the given token and position' do
      game_board1 = Board.new
      test_board1 = [
        [' ', ' ', ' '],
        [' ', ' ', 'X'],
        [' ', ' ', ' ']
      ]

      expect(game_board1.update_position(6, 'X')).to eql(test_board1)
    end
  end

  describe '#test_win' do
    game_board2 = Board.new
    game_board2.board = [
      %w[X X O],
      %w[O O X],
      ['O', ' ', 'O']
    ]

    it "Returns true if there's a win combination" do
      expect(game_board2.test_win('O')).to eql(true)
    end
  end
end
