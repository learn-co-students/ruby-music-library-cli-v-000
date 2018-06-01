class MusicLibraryController
  def initialize(library_path)
    MusicImporter.new(library_path)
  end
  
  def MusicImporter
    @path = path
  end
end