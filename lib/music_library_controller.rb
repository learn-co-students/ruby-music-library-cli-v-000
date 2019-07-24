class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_instance = MusicImporter.new(path)
    new_instance.import
  end

end
