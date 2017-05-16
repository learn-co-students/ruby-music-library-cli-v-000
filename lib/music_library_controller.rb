class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music = MusicImporter.new(path)
    music.import
  end

  def call
    
  end
end
