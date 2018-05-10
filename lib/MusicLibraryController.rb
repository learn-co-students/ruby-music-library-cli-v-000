class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
   
    
  end 
  
  def call 
     user_input = nil
    
    while user_input != "exit"
        puts "Welcome to your music library!"
        puts "What would you like to do ?"
        
        user_input = gets.strip 
        case user_input 
        
          when "list songs"
            songs
          when "list artists"
            artists
          when "list genres"
            genres
          when "list artist"
            list_artist
          when "list genre"
            list_genre
          when "play song"  
            play_song
        end 
    end
  end
  
end 