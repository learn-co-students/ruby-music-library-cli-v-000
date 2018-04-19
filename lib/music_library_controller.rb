
class MusicLibraryController < MusicImporter
  def initialize(path = "./db/mp3s")
    super(path)
  end
end
