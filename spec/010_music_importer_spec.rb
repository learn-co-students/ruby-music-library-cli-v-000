require 'spec_helper'

describe "MusicImporter" do
  describe '#intialize' do
    it 'accepts a file path to parse mp3 files from' do
      test_music_path = "./spec/fixtures/mp3s"
      music_importer = MusicImporter.new(test_music_path)

      expect(music_importer.path).to eq(test_music_path)
    end
  end

  describe '#files' do
    it 'loads all the mp3 files in the path directory' do
      test_music_path = "./spec/fixtures/mp3s"
      music_importer = MusicImporter.new(test_music_path)

      expect(music_importer.files.size).to eq(4)
    end

    it 'normalizes the filename to just the mp3 filename with no path' do
      test_music_path = "./spec/fixtures/mp3s"
      music_importer = MusicImporter.new(test_music_path)

      expect(music_importer.files).to include("Action Bronson - Larry Csonka - indie.mp3")
      expect(music_importer.files).to include("Real Estate - Green Aisles - country.mp3")
      expect(music_importer.files).to include("Real Estate - It's Real - hip-hop.mp3")
      expect(music_importer.files).to include("Thundercat - For Love I Come - dance.mp3")
    end
  end
end

describe 'Making Songs from filenames' do
  describe 'Song.new_from_filename' do
    it 'initializes a song based on the filename delimiters' do
      song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

      expect(song.name).to eq("For Love I Come")
      expect(song.artist.name).to eq("Thundercat")
      expect(song.genre.name).to eq("dance")
    end

    it 'maintains unique objects' do
      artist = Artist.create("Thundercat")
      genre = Genre.create("dance")

      song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
      expect(song.artist).to eq(artist)
      expect(song.genre).to eq(genre)
    end
  end

  describe 'Song.create_from_filename' do
    it 'initializes and saves a song based on the filename delimiters' do
      song = Song.create_from_filename("Thundercat - For Love I Come - dance.mp3")

      expect(song).to eq(Song.find_by_name("For Love I Come"))
      expect(song.artist).to eq(Artist.find_by_name("Thundercat"))
      expect(song.genre).to eq(Genre.find_by_name("dance"))
    end

    it 'maintains unique objects' do
      artist = Artist.create("Thundercat")
      genre = Genre.create("dance")

      song = Song.create_from_filename("Thundercat - For Love I Come - dance.mp3")
      expect(song.artist).to eq(artist)
      expect(song.genre).to eq(genre)
    end
  end
end

describe "MusicImporter#import" do
  it 'imports the files into the library by creating songs from a filename' do
    test_music_path = "./spec/fixtures/mp3s"
    music_importer = MusicImporter.new(test_music_path)
    music_importer.import

    expect(Song.all.size).to eq(4)
    expect(Artist.all.size).to eq(3)
    expect(Genre.all.size).to eq(4)

    expect(Song.find_by_name("Green Aisles").artist.name).to eq("Real Estate")
    expect(Song.find_by_name("Green Aisles").artist.songs.size).to eq(2)
  end
end
