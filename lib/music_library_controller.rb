require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    imported = MusicImporter.new(path)
    imported.import
  end
end
