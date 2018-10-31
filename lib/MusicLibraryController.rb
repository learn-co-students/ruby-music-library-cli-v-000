class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = nil)
    default_path = ".../db/mp3s/"
    self.path= default_path  if path != nil
  end 

  def call 
  end 
  

end 