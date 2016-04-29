require 'spec_helper'

describe "Songs and Genres" do
  context 'Genres have many songs' do
    it 'initializes with a songs property set to an empty array' do
      genre = Genre.new("indie rock")

      expect(genre.songs).to eq([])
    end

    it 'can push a song into the genre\'s song collection' do
      genre = Genre.new("indie rock")
      song = Song.new("In an Aeroplane Over the Sea")

      genre.songs << song
      expect(genre.songs).to include(song)
    end
  end

  context 'Songs belong to a genre' do
    describe '#genre=' do
      it 'accepts an genre for the song' do
        song = Song.new("In an Aeroplane Over the Sea")
        genre = Genre.new("indie rock")
        song.genre = genre

        expect(song.genre).to eq(genre)
      end

      it 'adds the song to the genre\'s songs' do
        song = Song.new("In an Aeroplane Over the Sea")
        genre = Genre.new("indie rock")
        song.genre = genre

        expect(genre.songs).to include(song)
      end

      it 'does not add the song to the genre\'s songs if it already exists' do
        song = Song.new("In an Aeroplane Over the Sea")
        genre = Genre.new("indie rock")

        song.genre = genre
        song.genre = genre

        expect(genre.songs).to include(song)
        expect(genre.songs.size).to eq(1)
      end
    end
  end

  context 'initializing a song with a genre' do
    it 'songs accept an optional argument for the genre' do
      genre = Genre.new("indie rock")
      artist = Artist.new("Neutral Milk Hotel")
      song = Song.new("In an Aeroplane Over the Sea", artist, genre)

      expect(genre.songs).to include(song)
      expect(song.genre).to eq(genre)
    end
  end
end
