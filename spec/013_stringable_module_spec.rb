require "spec_helper"
require_relative "../config/environment.rb"

describe "Concerns::Stringable" do
  it "defines a module named Concerns::Stringable" do
    expect(defined?(Concerns::Stringable)).to be_truthy
    expect(Concerns::Stringable).to_not be_a(Class)
    expect(Concerns::Stringable).to be_a(Module)
  end
end

describe "Song" do
  it "includes the Concerns::Stringable module" do
  song_includes_concerns_stringable = Song.ancestors.include?(Concerns::Stringable)
    expect(song_includes_concerns_stringable).to eq(true)
  end
end

describe "Artist" do
  it "includes the Concerns::Stringable module" do
    artist_includes_concerns_stringable = Artist.ancestors.include?(Concerns::Stringable)
    expect(artist_includes_concerns_stringable).to eq(true)
  end
end

describe "Genre" do
  it "includes the Concerns::Stringable module" do
    genre_includes_concerns_stringable = Genre.ancestors.include?(Concerns::Stringable)
    expect(genre_includes_concerns_stringable).to eq(true)
  end
end

describe "Concerns::Stringable" do
  # let!(:artist) { Artist.create("Slowdive") }
  # let!(:genre) { Genre.create("shoegaze") }

  describe "#to_s" do
    it "is added as an instance method to classes that include the module" do
      an_artist = Artist.new("Joan Jett")
      expect(an_artist).to respond_to(:to_s)
    end

    it "will return a string" do
      an_artist = Artist.new("Joan Jett")
      expect(an_artist.to_s).to be_a(String)
    end

    it "will return the name of the artist as a string" do
      an_artist = Artist.new("Joan Jett")
      expect(an_artist.to_s).to eq("Joan Jett")
    end
  end

  describe "#<=>" do
    it "is added as an instance method to classes that include the module" do
      an_artist = Artist.new("Joan Jett")
      expect(an_artist).to respond_to(:<=>)
    end

    it "does the same thing as String#<=>" do
      an_artist = Artist.new("David Bowie")
      other_artist = Artist.new("Janelle Monae")

      expect(an_artist <=> other_artist).to be("David Bowie" <=> "Janelle Monae")
    end

    it "makes the included class sortable!! fuck yeahhhhh" do
      an_artist = Artist.new("David Bowie")
      other_artist = Artist.new("Janelle Monae")

      expect([other_artist, an_artist].sort).to eq([an_artist, other_artist])
    end
  end
end
