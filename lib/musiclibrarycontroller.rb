class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    new_object = MusicImporter.new(path)
    new_object.import
  end
  
  def call
    
    ip = ""
    
    while ip != exit
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    ip = gets.strip
    
    if ip == "list songs"
      list_songs
      
    elsif ip == "list artists"
      list_artists
      
    elsif ip == "list genres"
      list_genres
      
    elsif ip == "list artist"
      list_songs_by_artist
      
    elsif ip == "list genre"
      list_songs_by_genre
      
    elsif ip == "play song"
      play_song
      
    elsif ip == "exit"
    end
    
    end
    
  end
  
  def list_songs
 
  end
  
  def list_artists
 
  end
  
  def list_genres
 
  end
  
  def list_artist
 
  end
  
  def list_genre
 
  end
  
  def play_song
 
  end
  
end