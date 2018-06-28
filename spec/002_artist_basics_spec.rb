require "spec_helper"

describe "Artist" do
  describe "#initialize" do
    it "accepts a name for the new artist" do
      artist = Artist.new("Neutral Milk Hotel")
      expect(artist.instance_variable_defined?(:@name)).to be(true)
      expect(artist.instance_variable_get(:@name)).to eq("Neutral Milk Hotel")
    end
  end

  describe "#name" do
    it "retrieves the name of an artist" do
      artist = Artist.new("Neutral Milk Hotel")
      expect(artist.name).to eq("Neutral Milk Hotel")
    end
  end

  describe "#name=" do
    it "can set the name of an artist" do
      artist = Artist.new("Neutral Milk Hotel")
      artist.name = "Jeff Mangum"
      expect(artist.name).to eq("Jeff Mangum")
    end
  end

  describe '@@all' do
    it 'is set to an empty array' do
      all = Artist.class_variable_get(:@@all)
      expect(all).to match_array([])
    end
  end

  describe ".all" do
    it "returns the class variable @@all" do
      expect(Artist.all).to match_array([])

      artist = Artist.new("Fear of Tigers")
      Artist.class_variable_set(:@@all, [artist])
      expect(Artist.all).to match_array([artist])
    end
  end

  describe ".destroy_all" do
    it "resets the @@all class variable to an empty array" do
      Artist.destroy_all
      expect(Artist.all).to match_array([])
    end
  end

  describe "#save" do
    it "adds the Artist instance to the @@all class variable" do
      artist = Artist.new("Neutral Milk Hotel")
      artist.save
      expect(Artist.all).to include(artist)
    end
  end

  describe ".create" do
    it "initializes and saves the artist" do
      artist = Artist.create("Neutral Milk Hotel")
      expect(Artist.all).to include(artist)
    end
  end
end
