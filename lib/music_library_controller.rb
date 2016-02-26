class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = gets.strip
    if input = "list songs"
      songs
    end
  end
end
