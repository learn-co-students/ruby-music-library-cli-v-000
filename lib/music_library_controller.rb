
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    new_importer = MusicImporter.new(path)
    new_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
  end


end
