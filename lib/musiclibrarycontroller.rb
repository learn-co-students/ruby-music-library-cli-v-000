class MusicLibraryController

  attr_accessor :path

  def initialize(path)
    musicimporter = MusicImporter.new(path =./db/mp3s/)
    musicimporter.import
  end
end
