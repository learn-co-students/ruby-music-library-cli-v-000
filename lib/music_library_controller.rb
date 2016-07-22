class MusicLibraryController
attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    path = MusicImporter.new(path).import  # creates a MusicImporter with that path and imports the music
  end


end
