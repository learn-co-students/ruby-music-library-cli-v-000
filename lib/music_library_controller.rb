class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter
  end
end
