require 'spec_helper'

describe "Board" do
  let(:board){Board.new}

  describe '#cells' do
    it 'has an attribute to store the cells of the board' do
      expect(board).to respond_to(:cells)
      expect(board).to respond_to(:cells=)

      board.cells = []
      expect(board.cells).to match_array([])
    end
  end

  describe '#reset!' do
    it 'can reset the state of the cells in the board' do
      expect(board).to respond_to(:reset!)
      board.cells = ["X"]
      board.reset!
      expect(board.cells).to_not match_array(["X"])
    end
    it 'sets the cells of the board to a 9 element array of " "' do
      board.cells = ["X"]
      board.reset!
      expect(board.cells).to match_array(Array.new(9, " "))
    end
  end

  describe '#initialize' do
    it 'sets the cells of the board to a 9 element array of " "' do
      board = Board.new
      expect(board.cells).to match_array(Array.new(9, " "))
    end
  end

  describe '#display' do
    it 'prints the board' do
      board.cells = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]

      output = capture_puts{ board.display }

      expect(output).to include(" X | X | X ")
      expect(output).to include("-----------")
      expect(output).to include(" X | O | O ")
      expect(output).to include("-----------")
      expect(output).to include(" X | O | O ")


      board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      output = capture_puts{ board.display }

      expect(output).to include(" X | O | X ")
      expect(output).to include("-----------")
      expect(output).to include(" O | X | X ")
      expect(output).to include("-----------")
      expect(output).to include(" O | X | O ")
    end
  end

  describe '#position' do
    it 'takes in user input and returns the value of the board cell' do
      board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]

      expect(board.position("1")).to eq("O")
      expect(board.position("2")).to eq(" ")
      expect(board.position("5")).to eq("X")
    end
  end

  describe '#full?' do
    it 'returns true for a full board' do
      board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(board.full?).to be_truthy
    end

    it 'returns false for an in-progress game' do
      board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(board.full?).to be_falsey
    end
  end

  describe '#turn_count' do
    it 'returns the amount of turns based on cell value' do
      board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]

      expect(board.turn_count).to eq(3)
    end
  end

  describe '#taken?' do
    it 'returns true if the position is X or O' do
      board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", "O"]

      expect(board.taken?("1")).to be(true)
      expect(board.taken?("9")).to be(true)
    end

    it 'returns false if the position is empty or blank' do
      board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", "O"]

      expect(board.taken?("2")).to be(false)
      expect(board.taken?("7")).to be(false)
    end
  end

  describe '#valid_move?' do
    it 'returns true for user input between 1-9 that is not taken' do
      board.cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "]

      expect(board.valid_move?("1")).to be_truthy
      expect(board.valid_move?("5")).to be_falsey
      expect(board.valid_move?("invalid")).to be_falsey
    end
  end

  describe '#update' do
    it 'updates the cells in the board with the player token according to the input' do
      player = double("player", :token => "X")

      board.update("1", player)
      expect(board.position("1")).to eq("X")
    end
  end
end
