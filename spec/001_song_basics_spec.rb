require 'spec_helper'

describe "Song Basics" do
  describe '#initialize with #name' do
    it 'accepts a name for the song' do
      song = Song.new("In an Aeroplane Over the Sea")
      expect(song.name).to eq("In an Aeroplane Over the Sea")
    end
  end

  describe '#name=' do
    it "sets the song name" do
      song = Song.new("In an Aeroplane Over the Sea")
      song.name = "Jump Around"

      expect(song.name).to eq("Jump Around")
    end
  end

  describe '.all' do
    it 'returns the class variable @@all' do
      Song.class_variable_set(:@@all, [])

      expect(Song.all).to match_array([])
    end
  end

  describe '.destroy_all' do
    it 'resets the @@all class variable to an empty array' do
      Song.class_variable_set(:@@all, ["Song"])

      Song.destroy_all
      expect(Song.all).to match_array([])
    end
  end

  describe '#save' do
    it 'adds the song instance to the @@all class variable' do
      song = Song.new("In an Aeroplane Over the Sea")

      song.save

      expect(Song.all).to include(song)
    end
  end

  describe '.create' do
    it 'initializes and saves the song' do
      song = Song.create("In an Aeroplane Over the Sea")

      expect(Song.all).to include(song)
    end
  end
end
