
class MusicLibraryController
  #attr_reader :music_importer

  def initialize(path_ = "./db/mp3s") # = "./db/mp3s")
    self.music_importer = MusicImporter.new(path_)
  end

  def call
    #Do something
  end

  private
  attr_accessor :music_importer

end
