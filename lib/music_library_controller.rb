class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end 
  
  def call 
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    input = ""
    while input != "exit"
   
    
    input = gets.strip
    case input
      when "list songs"
        songs
      end
   end
  end
  
  
end