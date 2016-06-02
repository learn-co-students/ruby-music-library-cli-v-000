
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    binding.pry
    MusicImporter.new(path).import
    
  end

end