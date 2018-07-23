require_relative '../lib/music_importer'

class MusicLibraryController
  attr_reader :path
  
  def initialize(path="../db/mp3s")
    @path = path
  end
  
end