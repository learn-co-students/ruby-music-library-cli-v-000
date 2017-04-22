require 'pry'

class MusicLibraryController
  attr_reader :path, :song, :artist, :genre

    def initialize(path="./db/mp3s")
      music_importer = MusicImporter.new(path)
      music_importer
      music_importer.import
    end

    def call

    end

end
