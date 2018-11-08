class MusicLibraryController
  
  attr_accessor :path, :import
  
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
    # self.new(path)
  end
  
  def MusicImporter.import(path)
    MusicImporter.new(path)
  end
  
  def call
    MusicLibraryController.new(path)
      puts "Welcome to your music library!"
      puts 
  end
    
  
end