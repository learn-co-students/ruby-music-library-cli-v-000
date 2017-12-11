class MusicLibraryController
  attr_accessor :path

  def initialize(path)
    MusicImporter.new(path)
  end
end
