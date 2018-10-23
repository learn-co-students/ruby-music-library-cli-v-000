class MusicLibraryController
  #attr_reader :path
  
  def initialize(path = "./db/mp3s") 
    @path = path 
    MusicImporter.new(path).import
  end 
  
  def call 
    input = ""
    while input != "exit" 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    
    case input 
      when "list songs" 
        song 
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
   
  def list_songs
    Songs.all.sort{|a,b| a.name 
  end 
     
  
   
 end  
 