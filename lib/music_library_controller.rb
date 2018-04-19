
class MusicLibraryController < MusicImporter
  def initialize(path_ = "./db/mp3s") # = "./db/mp3s")
    super("./db/mp3s")
  end
end
