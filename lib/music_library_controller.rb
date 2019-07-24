class MusicLibraryController

  def initialize(path)
    new_instance = MusicImporter.new(path )
  end

end
