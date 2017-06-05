require "spec_helper"

describe "Associations — Artist and Genre:" do
  before(:each) do
    @genre1 = Genre.new("indie rock")
    @genre2 = Genre.new("electro pop")
    @artist1 = Artist.new("The Magnetic Fields")
    @artist2 = Artist.new("Neutral Milk Hotel")
  end

  context "Artist" do
    describe "#genres" do
      it "returns a collection of genres for all of the artist's songs (artist has many genres through songs)" do
        Song.new("The Luckiest Guy on the Lower East Side", @artist1, @genre1)
        Song.new("Long-Forgotten Fairytale", @artist1, @genre2)

        expect(@artist1.genres).to include(@genre1)
        expect(@artist1.genres).to include(@genre2)
        expect(@artist1.genres.size).to be(2)
      end

      it "does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)" do
        Song.new("In the Aeroplane Over the Sea", @artist2, @genre1)
        Song.new("Two-Headed Boy", @artist2, @genre1)

        expect(@artist2.genres).to include(@genre1)
        expect(@artist2.genres.size).to eq(1)
      end

      it "collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)" do
        Song.new("In the Aeroplane Over the Sea", @artist2, @genre1)
        expect(@artist2.instance_variable_defined?(:@genres)).to be_falsey
      end
    end
  end

  context "Genre" do
    describe "#artists" do
      it "returns a collection of artists for all of the genre's songs (genre has many artists through songs)" do
        Song.new("The Luckiest Guy on the Lower East Side", @artist1, @genre1)
        Song.new("In the Aeroplane Over the Sea", @artist2, @genre1)

        expect(@genre1.artists).to include(@artist1)
        expect(@genre1.artists).to include(@artist2)
        expect(@genre1.artists.size).to be(2)
      end

      it "does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)" do
        Song.new("In the Aeroplane Over the Sea", @artist2, @genre1)
        Song.new("Two-Headed Boy", @artist2, @genre1)

        expect(@genre1.artists).to include(@artist2)
        expect(@genre1.artists.size).to eq(1)
      end

      it "collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)" do
        Song.new("In the Aeroplane Over the Sea", @artist2, @genre1)
        expect(@genre1.instance_variable_defined?(:@artists)).to be_falsey
      end
    end
  end
end
