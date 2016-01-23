class MusicLibraryController

  attr_accessor :path, :song, :artist, :genre

  def initialize(path = "./db/mp3s")
    @path = path
  end

end