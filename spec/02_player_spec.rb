require 'spec_helper'

describe 'Player' do

  describe '#initialize' do
    it 'accepts a token to assign' do
      player = Player.new("X")
      expect(player.token).to eq("X")
    end
  end

  describe '#token' do
    it 'cannot be changed once assigned in initialize' do
      player = Player.new("O")
      expect(player.token).to eq("O")

      expect{player.token = "O"}.to raise_error(NoMethodError)
      expect(player).to_not respond_to(:token=)
    end
  end
end
