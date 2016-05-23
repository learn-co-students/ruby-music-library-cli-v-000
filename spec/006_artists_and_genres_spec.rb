require 'spec_helper'

describe "Artists have many genres through songs" do
  describe '#genres' do
    it 'returns the unique genres belonging to all the songs of the artist' do
      genre = Genre.new("indie rock")
      artist = Artist.new("Neutral Milk Hotel")
      song = Song.new("In an Aeroplane Over the Sea", artist, genre)
      song = Song.new("Two Headed Boy pt 1", artist, genre)

      expect(artist.genres).to include(genre)
      expect(artist.genres.size).to eq(1)
    end

    it 'returns only unique genres for an artist if more than one song has the same genre' do
      indie_rock = Genre.new("indie rock")
      electro_pop = Genre.new("electro pop")
      artist = Artist.new("The Magnetic Fields")

      song = Song.new("Long-forgotten Fairytale", artist, electro_pop)
      song = Song.new("The Book of Love", artist, indie_rock)
      song = Song.new("Papa was a Rodeo", artist, indie_rock)

      expect(artist.genres).to match_array([indie_rock, electro_pop])
      expect(artist.genres.size).to eq(2)
    end

    it 'does not use an instance variable @genres and collects genres from songs everytime' do
      indie_rock = Genre.new("indie rock")
      electro_pop = Genre.new("electro pop")
      artist = Artist.new("The Magnetic Fields")

      song = Song.new("Long-forgotten Fairytale", artist, electro_pop)

      expect(artist.genres).to match_array([electro_pop])
      expect(artist.instance_variable_defined?(:@genres)).to be_falsey

      song = Song.new("The Book of Love", artist, indie_rock)
      expect(artist.genres).to match_array([indie_rock, electro_pop])
    end
  end
end

describe "Genres have many artists through songs" do
  describe '#artists' do
    it 'returns only unique artists for a genre when artists have multiple songs' do
      genre = Genre.new("indie rock")

      neutral_milk_hotel = Artist.new("Neutral Milk Hotel")
      the_magnetic_fields = Artist.new("The Magnetic Fields")

      Song.new("In an Aeroplane Over the Sea", neutral_milk_hotel, genre)
      Song.new("The Book of Love", the_magnetic_fields, genre)
      Song.new("Papa was a Rodeo", the_magnetic_fields, genre)

      expect(genre.artists).to match_array([neutral_milk_hotel, the_magnetic_fields])
      expect(genre.artists.size).to eq(2)
    end

    it 'does not use an instance variable @artists and collects artists from songs everytime' do
      genre = Genre.new("indie rock")

      neutral_milk_hotel = Artist.new("Neutral Milk Hotel")
      the_magnetic_fields = Artist.new("The Magnetic Fields")

      Song.new("The Book of Love", the_magnetic_fields, genre)
      Song.new("Papa was a Rodeo", the_magnetic_fields, genre)

      expect(genre.artists).to match_array([the_magnetic_fields])
      expect(genre.instance_variable_defined?(:@artists)).to be_falsey

      Song.new("In an Aeroplane Over the Sea", neutral_milk_hotel, genre)

      expect(genre.artists).to match_array([neutral_milk_hotel, the_magnetic_fields])
    end
  end
end
