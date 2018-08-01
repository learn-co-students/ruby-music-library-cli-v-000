class MusicLibraryController
  def initialize(path = "./db/mp3s/")
    MusicImporter.new
  end
end
