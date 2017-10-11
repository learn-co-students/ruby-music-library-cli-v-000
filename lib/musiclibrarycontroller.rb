class MusicLibraryController

  attr_accessor :path

  def initialize(path ='./db/mp3s/' )
    musicimporter = MusicImporter.new(path ="./spec/fixtures/mp3s")
    musicimporter.import
  end
end
