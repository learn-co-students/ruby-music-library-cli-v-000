require 'spec_helper'

describe 'Player::Human' do
  it 'inherits from Player' do
    expect(Player::Human.ancestors).to include(Player)
  end

  describe '#move' do
    it 'asks the user for input and returns it' do
      human = Player::Human.new("X")
      allow($stdout).to receive(:puts)

      expect(human).to receive(:gets).and_return("1")

      expect(human.move([])).to eq("1")
    end
  end
end
