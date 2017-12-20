class MusicLibraryController  
  # create initialize method 
 
  extend Concerns::Findable 
  
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import 
  end 
  
  def instructions
    # add puts statements into a separate method 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end 
  
  # create call method 
  def call 
    # this method should determine which method you want to call
    # refactor - each puts statement should be calling the method that the user_input gets 
    instructions
    # add puts statements into a separate method 
  
    user_input = nil # need to evaluate what user_input is and determin which method is needed - should set a placeholder (nil)
#  until user_input == "exit"  
  end 
  
  def list_songs
  # place list_songs method here - this is for song objects which have been created 
    # print out as an ordered list 
    # where are the song objects that have been created ? 
      Song.all.sort_by {|list| list.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
      end
  end 
    
  def list_artists
    Artist.all.sort_by {|list| list.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}" 
    end
    
  def list_genres
    Genre.all.sort_by {|list| list.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}" 
    end 
  end 
    
    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist = gets.chomp
#      self.list_songs
      binding.pry  
      
      
        
     
#      song_list = Song.all.sort_by {|list| list.name}.each_with_index do |song, index|
 # puts "#{index + 1}. #{song.artist.name} - #{song.genre.name}"
#      puts song_list 
  
    end 
  
  end 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end 