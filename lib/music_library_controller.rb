class MusicLibraryController 
  
  extend Concerns::Findable 
  
  def initialize(path)
    @path = path 
    MusicImporter.new(path)
  end 
  
  
  
end 