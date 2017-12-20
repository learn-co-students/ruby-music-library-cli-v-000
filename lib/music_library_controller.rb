class MusicLibraryController  
  # create initialize method 
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import 
  end 
  
  # create call method 
  def call 
    puts "Welcome to your music library!"
  end 
  
  
  
  
end 