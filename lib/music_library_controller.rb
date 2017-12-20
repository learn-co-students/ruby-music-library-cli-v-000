class MusicLibraryController 
  
  extend Concerns::Findable 
  
  def initialize(path)
    @path = path 
    self.create(path)
  end 
  
  
  
end 