class MusicLibraryController
  attr_reader :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
   
  end
end