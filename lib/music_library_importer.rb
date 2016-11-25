class MusicLibraryController

  def initialize(path='./db/mp3s')
    # binding.pry
    importer = MusicImporter.new(path)
    # binding.pry
    #importer.import

  end

  def call

  end



end
