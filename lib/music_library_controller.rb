
class MusicLibraryController
  attr_accessor :music_importer

  def initialize(path_ = "./db/mp3s") # = "./db/mp3s")
    self.music_importer = MusicImporter.new(path_)
    self.music_importer.import
  end

  def call
    puts "Welcome to your music library!"
  end

  private
  #attr_accessor :music_importer

end
