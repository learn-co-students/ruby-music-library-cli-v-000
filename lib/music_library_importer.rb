class MusicLibraryController

  def initialize(path='./db/mp3s')
    importer = MusicImporter.new(path)
    binding.pry
    # importer.import

  end

  def split

  end



end
