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
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = nil 
      until input == "exit"
        input = gets.strip 
      end
  end

  
end

# class CLIMethods
  
#   def list_songs
#     prints all songs in the music library in a numbered list (alphabetized by song name)"
#           1. Thundercat - For Love I Come 
#           2. Real Estate - Green Aisles 
#           3. Real Estate - It's Real 
#           4. Action Bronson 
#           5. What's Golden 

#       music_library_controller.list_songs
    
#   end
  