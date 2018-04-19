
class MusicLibraryController < MusicImporter
  def initialize(path_ = "./db/mp3s") # = "./db/mp3s")
    super(path_)
  end
end
