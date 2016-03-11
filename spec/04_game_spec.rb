require 'spec_helper'

describe 'Game' do
  describe '::WIN_COMBINATIONS' do
    it 'defines a constant WIN_COMBINATIONS with arrays for each win combination' do
      expect(Game::WIN_COMBINATIONS).to include_array([0,1,2])
      expect(Game::WIN_COMBINATIONS).to include_array([3,4,5])
      expect(Game::WIN_COMBINATIONS).to include_array([6,7,8])
      expect(Game::WIN_COMBINATIONS).to include_array([0,3,6])
      expect(Game::WIN_COMBINATIONS).to include_array([1,4,7])
      expect(Game::WIN_COMBINATIONS).to include_array([2,5,8])
      expect(Game::WIN_COMBINATIONS).to include_array([0,4,8])
      expect(Game::WIN_COMBINATIONS).to include_array([6,4,2])
    end
  end

  describe '#board' do
    it 'provides access to the board' do
      game = Game.new
      game.board = []
      expect(game.board).to eq([])
    end
  end

  describe '#player_1' do
    it 'provides access to player_1' do
      game = Game.new
      player_1 = Player.new("X")
      game.player_1 = player_1
      expect(game.player_1).to eq(player_1)
    end
  end

  describe '#player_2' do
    it 'provides access to player_2' do
      game = Game.new
      player_2 = Player.new("X")
      game.player_2 = player_2
      expect(game.player_2).to eq(player_2)
    end
  end

  describe 'initialize' do
    it 'accepts 2 players and a board' do
      board = Board.new
      player_1 = Player.new("X")
      player_2 = Player.new("O")

      game = Game.new(player_1, player_2, board)

      expect(game.player_1).to eq(player_1)
      expect(game.player_2).to eq(player_2)
      expect(game.board).to eq(board)
    end

    it 'defaults to two human players, X and O, with am empty board' do
      game = Game.new

      expect(game.player_1).to be_a(Player::Human)
      expect(game.player_1.token).to eq("X")

      expect(game.player_2).to be_a(Player::Human)
      expect(game.player_2.token).to eq("O")

      expect(game.board.cells).to match_array(Array.new(9, " "))
    end
  end

  describe '#current_player' do
    it 'returns the correct player, X, for the third move' do
      game = Game.new
      game.board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", " "]

      expect(game.current_player.token).to eq("X")
    end
  end

  describe '#over?' do
    it 'returns true for a draw' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(game.over?).to be_truthy
    end

    it 'returns true for a won game' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(game.over?).to be_truthy
    end

    it 'returns false for an in-progress game' do
      game = Game.new
      game.board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(game.over?).to be_falsey
    end
  end

  describe '#won?' do
    it 'returns false for a draw' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(game.won?).to be_falsey
    end

    it 'returns true for a win' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(game.won?).to be_truthy
    end
  end

  describe '#draw?' do
    it 'returns true for a draw' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(game.draw?).to be_truthy
    end

    it 'returns false for a won game' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(game.draw?).to be_falsey
    end

    it 'returns false for an in-progress game' do
      game = Game.new
      game.board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]

      expect(game.draw?).to be_falsey
    end
  end

  describe 'winner' do
    it 'returns X when X won' do
      game = Game.new
      game.board.cells = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]

      expect(game.winner).to eq("X")
    end

    it 'returns O when O won' do
      game = Game.new
      game.board.cells = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]

      expect(game.winner).to eq("O")
    end

    it 'returns nil when no winner' do
      game = Game.new
      game.board.cells = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]

      expect(game.winner).to be_nil
    end
  end

  describe 'turn' do
    it 'makes valid moves' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("1")

      game.turn
    end

    it 'asks for input again after a failed validation' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("invalid")
      expect(game.player_1).to receive(:gets).and_return("1")

      game.turn
    end

    it 'changes to player 2 after the first turn' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("1")
      expect(game.player_2).to receive(:gets).and_return("2")

      game.turn
      game.turn
    end
  end

  describe 'play' do
    it 'asks for players input on a turn of the game' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game).to receive(:over?).and_return(false, true)

      expect(game.player_1).to receive(:gets).at_least(:once).and_return("1")

      game.play
    end

    it 'checks if the game is over after every turn' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2")
      allow(game.player_2).to receive(:gets).and_return("4", "5")

      expect(game).to receive(:over?).at_least(:twice).and_return(false, false, true)

      game.play
    end

    it 'plays the first turn of the game' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1")

      allow(game).to receive(:over?).and_return(false, true)

      game.play

      expect(game.board.cells).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'plays the first few turns of the game' do
      game = Game.new

      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2")
      allow(game.player_2).to receive(:gets).and_return("4")

      allow(game).to receive(:over?).and_return(false, false, false, true)

      game.play

      expect(game.board.cells).to eq(["X", "X", " ", "O", " ", " ", " ", " ", " "])
    end

    it 'checks if the game is won after every turn' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2", "3")
      allow(game.player_2).to receive(:gets).and_return("4", "5", "6")
      allow(game).to receive(:winner).and_return("X")

      expect(game).to receive(:won?).at_least(:twice).and_return(false, false, true)

      game.play
    end

    it 'checks if the game is draw after every turn' do
      game = Game.new
      allow($stdout).to receive(:puts)
      allow(game.player_1).to receive(:gets).and_return("1", "2")
      allow(game.player_2).to receive(:gets).and_return("3", "4")

      expect(game).to receive(:draw?).at_least(:twice).and_return(false, false, true)

      game.play
    end

    it 'stops playing if someone has won' do
      game = Game.new
      game.board.cells = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

      allow($stdout).to receive(:puts)

      expect(game).to_not receive(:turn)

      game.play
    end

    it 'congratulates the winner X' do
      game = Game.new
      game.board.cells = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
      allow($stdout).to receive(:puts)

      expect($stdout).to receive(:puts).with("Congratulations X!")

      game.play
    end

    it 'congratulates the winner O' do
      game = Game.new
      game.board.cells = [" ", " ", " ", " ", " ", " ", "O", "O", "O"]

      allow($stdout).to receive(:puts)

      expect($stdout).to receive(:puts).with("Congratulations O!")

      game.play
    end

    it 'stops playing in a draw' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      allow($stdout).to receive(:puts)

      expect(game).to_not receive(:turn)

      game.play
    end

    it 'prints "Cats Game!" on a draw' do
      game = Game.new
      game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      allow($stdout).to receive(:puts)

      expect($stdout).to receive(:puts).with("Cats Game!")

      game.play
    end

    it 'plays through an entire game' do
      game = Game.new
      allow($stdout).to receive(:puts)

      expect(game.player_1).to receive(:gets).and_return("1")
      expect(game.player_2).to receive(:gets).and_return("2")
      expect(game.player_1).to receive(:gets).and_return("3")
      expect(game.player_2).to receive(:gets).and_return("4")
      expect(game.player_1).to receive(:gets).and_return("5")
      expect(game.player_2).to receive(:gets).and_return("6")
      expect(game.player_1).to receive(:gets).and_return("7")

      expect($stdout).to receive(:puts).with("Congratulations X!")

      game.play
    end
  end

  describe 'start' do
  end
end
