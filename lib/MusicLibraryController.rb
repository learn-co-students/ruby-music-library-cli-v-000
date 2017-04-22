class MusicLibraryController
  attr_accessor :artist, :genre, :song, :path

  def initialize(path=)
    MusicImporter.new
  end

end
