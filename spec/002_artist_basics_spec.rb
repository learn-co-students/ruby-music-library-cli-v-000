require 'spec_helper'

describe "Artist Basics" do
  describe '#initialize with #name' do
    it 'accepts a name for the song' do
      artist = Artist.new("Neutral Milk Hotel")
      expect(artist.name).to eq("Neutral Milk Hotel")
    end
  end

  describe '#name=' do
    it "sets the artist name" do
      artist = Artist.new("Neutral Milk Hotel")
      artist.name = "Jeff Mangum"

      expect(artist.name).to eq("Jeff Mangum")
    end
  end

  describe '.all' do
    it 'returns the class variable @@all' do
      Artist.class_variable_set(:@@all, [])

      expect(Artist.all).to match_array([])
    end
  end

  describe '.destroy_all' do
    it 'resets the @@all class variable to an empty array' do
      Artist.class_variable_set(:@@all, ["Artist"])

      Artist.destroy_all
      expect(Artist.all).to match_array([])
    end
  end

  describe '#save' do
    it 'adds the artist instance to the @@all class variable' do
      artist = Artist.new("Neutral Milk Hotel")

      artist.save

      expect(Artist.all).to include(artist)
    end
  end

  describe '.create' do
    it 'initializes and saves the artist' do
      artist = Artist.create("Neutral Milk Hotel")

      expect(Artist.all).to include(artist)
    end
  end
end
