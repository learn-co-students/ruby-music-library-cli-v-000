require 'spec_helper'

describe "Songs and Artists" do
  context 'Artists have many songs' do
    it 'initializes with a songs property set to an empty array' do
      artist = Artist.new("Neutral Milk Hotel")

      expect(artist.songs).to eq([])
    end

    it 'can push a song into the songs collection' do
      artist = Artist.new("Neutral Milk Hotel")
      song = Song.new("In an Aeroplane Over the Sea")

      artist.songs << song
      expect(artist.songs).to include(song)
    end
  end

  context 'Songs belong to an artist' do
    describe '#artist=' do
      it 'accepts an artist for the song' do
        song = Song.new("In an Aeroplane Over the Sea")
        artist = Artist.new("Neutral Milk Hotel")
        song.artist = artist

        expect(song.artist).to eq(artist)
      end

      # it 'enforces the type of object assigned to Artist'

      it 'adds the song to the artist\'s songs' do
        song = Song.new("In an Aeroplane Over the Sea")
        artist = Artist.new("Neutral Milk Hotel")
        song.artist = artist

        expect(artist.songs).to include(song)
      end
    end
  end

  context 'adding a song to an artist' do
    describe '#add_song' do
      it 'adds the song to the artist\'s song collection' do
        song = Song.new("In an Aeroplane Over the Sea")
        artist = Artist.new("Neutral Milk Hotel")
        artist.add_song(song)

        expect(artist.songs).to include(song)
      end
      it 'assigns the artist to the song' do
        song = Song.new("In an Aeroplane Over the Sea")
        artist = Artist.new("Neutral Milk Hotel")
        artist.add_song(song)

        expect(song.artist).to eq(artist)
      end
      it 'does not assign the artist to the song if the song already has the artist' do
        song = Song.new("In an Aeroplane Over the Sea")
        artist = Artist.new("Neutral Milk Hotel")

        song.artist = artist

        expect(song).to_not receive(:artist=)

        artist.add_song(song)
      end

      it 'does not add the song to the artist\'s song collection if the artist already has the song' do
        song = Song.new("In an Aeroplane Over the Sea")
        artist = Artist.new("Neutral Milk Hotel")

        artist.add_song(song)
        artist.add_song(song)

        expect(artist.songs).to include(song)
        expect(artist.songs.size).to eq(1)
      end
    end

    describe 'Song#artist=' do
      it 'uses add_song to add the song to the artist\'s collection' do
        song = Song.new("In an Aeroplane Over the Sea")
        artist = Artist.new("Neutral Milk Hotel")

        expect(artist).to receive(:add_song)

        song.artist = artist
      end
    end
  end

  context 'initializing a song with an artist' do
    it 'new songs accept an optional argument for the artist' do
      artist = Artist.new("Neutral Milk Hotel")
      song = Song.new("In an Aeroplane Over the Sea", artist)

      expect(artist.songs).to include(song)
      expect(song.artist).to eq(artist)
    end
  end
end
