require "spec_helper"

describe "Song" do
  describe "#initialize" do
    it "accepts a name for the new song" do
      song = Song.new("In the Aeroplane Over the Sea")
      expect(song.instance_variable_defined?(:@name)).to be(true)
      expect(song.instance_variable_get(:@name)).to eq("In the Aeroplane Over the Sea")
    end
  end

  describe "#name" do
    it "retrieves the name of a song" do
      song = Song.new("In the Aeroplane Over the Sea")
      expect(song.name).to eq("In the Aeroplane Over the Sea")
    end
  end

  describe "#name=" do
    it "can set the name of a song" do
      song = Song.new("In the Aeroplane Over the Sea")
      song.name = "Jump Around"
      expect(song.name).to eq("Jump Around")
    end
  end

  describe "@@all" do
    it "is set to an empty array" do
      all = Song.class_variable_get(:@@all)
      expect(all).to match_array([])
    end
  end

  describe ".all" do
    it "returns the class variable @@all" do
      expect(Song.all).to match_array([])

      song = Song.new("Kaohsiung Christmas")
      Song.class_variable_set(:@@all, [song])
      expect(Song.all).to match_array([song])
    end
  end

  describe ".destroy_all" do
    it "resets the @@all class variable to an empty array" do
      Song.destroy_all
      expect(Song.all).to match_array([])
    end
  end

  describe "#save" do
    it "adds the Song instance to the @@all class variable" do
      song = Song.new("In the Aeroplane Over the Sea")
      song.save
      expect(Song.all).to include(song)
    end
  end

  describe ".create" do
    it "initializes and saves the song" do
      song = Song.create("In the Aeroplane Over the Sea")
      expect(Song.all).to include(song)
    end
  end
end
