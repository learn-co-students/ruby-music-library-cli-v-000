class MusicLibraryController
  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(@path)
  end 
end 
