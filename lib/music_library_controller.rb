class MusicLibraryController 
  # create 
   
  
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import 
  end 
  
  
  
  
  
end 