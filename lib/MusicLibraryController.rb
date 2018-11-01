class MusicLibraryController
  
   extend Concerns::Findable

  
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
  end 
  


  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts  "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    4.times do
      list_songs = gets 
    end 
  end

  def self.list_songs
    song_list = Song.all.sort {|song| }

    puts song_list

  end 
  
  def self.list_artists
    
  end 

  def self.list_genres
  end 

 


end 