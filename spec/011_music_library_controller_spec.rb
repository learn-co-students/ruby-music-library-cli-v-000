require 'spec_helper'

describe 'MusicLibraryController' do
  describe '#initialize' do
    it 'accepts a path to import music' do
      expect{MusicLibraryController.new('./spec/fixtures/mp3s')}.to_not raise_error
    end

    it 'the path argument defaults to ./db/mp3s' do
      expect(MusicImporter).to receive(:new).with('./db/mp3s').and_return(MusicImporter.new('./db/mp3s'))
      MusicLibraryController.new
    end

    it 'creates a MusicImporter with that path and imports the music' do
      music_importer = MusicImporter.new('./spec/fixtures/mp3s')
      expect(MusicImporter).to receive(:new).with('./spec/fixtures/mp3s').and_return(music_importer)
      expect(music_importer).to receive(:import)

      MusicLibraryController.new('./spec/fixtures/mp3s')
    end

    it 'populates Song, Artist, and Genre' do
      music_importer = MusicImporter.new('./spec/fixtures/mp3s')
      expect(MusicImporter).to receive(:new).with('./spec/fixtures/mp3s').and_return(music_importer)

      MusicLibraryController.new('./spec/fixtures/mp3s')
      expect(Song.all.size).to eq(4)
      expect(Artist.all.size).to eq(3)
      expect(Genre.all.size).to eq(4)
    end
  end

  describe '#call' do
    it 'responds to a call method to start the CLI' do
      expect(MusicLibraryController.new).to respond_to(:call)
    end

    it 'asks the user for input at some point' do
      music_libray_controller = MusicLibraryController.new("./spec/fixtures/mp3s")

      expect(music_libray_controller).to receive(:gets).and_return("exit")
      music_libray_controller.call
    end
  end
end
