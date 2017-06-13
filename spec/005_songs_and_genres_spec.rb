require "spec_helper"

describe "Associations — Song and Genre:" do
  let(:song) { Song.new("In the Aeroplane Over the Sea") }
  let(:genre) { Genre.new("indie rock") }

  context "Genre" do
    describe "#initialize" do
      it "creates a 'songs' property set to an empty array (genre has many songs)" do
        expect(genre.instance_variable_defined?(:@songs)).to be(true)
        expect(genre.instance_variable_get(:@songs)).to eq([])
      end
    end

    describe "#songs" do
      it "returns the genre's 'songs' collection (genre has many songs)" do
        expect(genre.songs).to eq([])

        genre.songs << song

        expect(genre.songs).to include(song)
      end
    end
  end

  context "Song" do
    describe "#initialize" do
      it "can be invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property (song belongs to genre)" do
        artist = Artist.new("Neutral Milk Hotel")
        song_with_artist_and_genre = Song.new("In the Aeroplane Over the Sea", artist, genre)

        expect(song_with_artist_and_genre.instance_variable_defined?(:@genre)).to be(true)
        expect(song_with_artist_and_genre.instance_variable_get(:@genre)).to be(genre)
      end
    end

    describe "#genre" do
      it "returns the genre of the song (song belongs to genre)" do
        song.instance_variable_set(:@genre, genre)

        expect(song.genre).to be(genre)
      end
    end

    describe "#genre=" do
      it "assigns a genre to the song (song belongs to genre)" do
        song.genre = genre

        expect(song.genre).to be(genre)
      end

      it "adds the song to the genre's collection of songs (genre has many songs)" do
        song.genre = genre

        expect(genre.songs).to include(song)
      end

      it "does not add the song to the genre's collection of songs if it already exists therein" do
        2.times { song.genre = genre }

        expect(genre.songs).to include(song)
        expect(genre.songs.size).to be(1)
      end
    end

    describe "#initialize" do
      it "invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization" do
        artist = Artist.new("Neutral Milk Hotel")

        expect_any_instance_of(Song).to receive(:genre=).with(genre)
        Song.new("In the Aeroplane Over the Sea", artist, genre)
      end
    end
  end
end
