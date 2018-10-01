require "spec_helper"

describe "Associations — Artist and Genre:" do
  let(:genre) { Genre.new("indie rock") }
  let(:other_genre) { Genre.new("electro pop") }
  let(:artist) { Artist.new("The Magnetic Fields") }
  let(:other_artist) { Artist.new("Neutral Milk Hotel") }

  context "Artist" do
    describe "#genres" do
      it "returns a collection of genres for all of the artist's songs (artist has many genres through songs)" do
        Song.new("The Luckiest Guy on the Lower East Side", artist, genre)
        Song.new("Long-Forgotten Fairytale", artist, other_genre)

        expect(artist.genres).to include(genre)
        expect(artist.genres).to include(other_genre)
        expect(artist.genres.size).to be(2)
      end

      it "does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)" do
        Song.new("In the Aeroplane Over the Sea", other_artist, genre)
        Song.new("Two-Headed Boy", other_artist, genre)

        expect(other_artist.genres).to include(genre)
        expect(other_artist.genres.size).to eq(1)
      end

      it "collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)" do
        Song.new("In the Aeroplane Over the Sea", other_artist, genre)

        expect(other_artist.instance_variable_defined?(:@genres)).to be_falsey
      end
    end
  end

  context "Genre" do
    describe "#artists" do
      it "returns a collection of artists for all of the genre's songs (genre has many artists through songs)" do
        Song.new("The Luckiest Guy on the Lower East Side", artist, genre)
        Song.new("In the Aeroplane Over the Sea", other_artist, genre)

        expect(genre.artists).to include(artist)
        expect(genre.artists).to include(other_artist)
        expect(genre.artists.size).to be(2)
      end

      it "does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)" do
        Song.new("In the Aeroplane Over the Sea", other_artist, genre)
        Song.new("Two-Headed Boy", other_artist, genre)

        expect(genre.artists).to include(other_artist)
        expect(genre.artists.size).to eq(1)
      end

      it "collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)" do
        Song.new("In the Aeroplane Over the Sea", other_artist, genre)

        expect(genre.instance_variable_defined?(:@artists)).to be_falsey
      end
    end
  end
end
