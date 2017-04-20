require 'pry'

class MusicLibraryController
  attr_reader :path, :song, :artist, :genre

    def initialize(path=".d/db/mp3s")
      @path = path

    end

end
