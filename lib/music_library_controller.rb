class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    white input != "exit"
    puts "Welcome to your Music Library"
  end
end
