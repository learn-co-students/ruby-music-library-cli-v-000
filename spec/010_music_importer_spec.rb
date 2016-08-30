require 'spec_helper'

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
