require "spec_helper"

describe "Artist" do
  let(:artist) { Artist.new("Neutral Milk Hotel") }

  describe "#initialize" do
    it "accepts a name for the new artist" do
      expect(artist.instance_variable_defined?(:@name)).to be(true)
      expect(artist.instance_variable_get(:@name)).to eq("Neutral Milk Hotel")
    end
  end

  describe "#name" do
    it "retrieves the name of an artist" do
      expect(artist.name).to eq("Neutral Milk Hotel")
    end
  end

  describe "#name=" do
    it "can set the name of an artist" do
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
      artist.save

      expect(Artist.all).to include(artist)
    end
  end

  describe ".create" do
    it "initializes and saves the artist" do
      created_artist = Artist.create("Fear of Tigers")

      expect(Artist.all).to include(created_artist)
    end
  end
end
