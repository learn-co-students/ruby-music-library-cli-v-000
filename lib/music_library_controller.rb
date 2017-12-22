class MusicLibraryController  
  # create initialize method  
  
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
    user_input = gets.chomp # need to evaluate what user_input is and determin which method is needed - should set a placeholder (nil)
    # test-expression ? if-true-expression : if-false-expression 
    while user_input != "exit"
      instructions
      user_input = gets.chomp
        if user_input == "list songs"
          list_songs
        elsif user_input == "list artists"
          list_artists
        elsif user_input == "list genres"
          list_genres
        elsif user_input == "list artist"
          list_songs_by_artist
        elsif user_input == "list genre"
          list_songs_by_genre
        elsif user_input == "play_song"
          play_song
#    elsif user_input == "exit" - not sure how to evaulate this part  
      end
    end
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
  end
    
  def list_genres
    Genre.all.sort_by {|list| list.name}.each_with_index do |item, index| 
      puts "#{index + 1}. #{item.name}" 
    end 
  end 
  
  def find_by_name(name)
    Artist.all.find do |item|
        item.name == name
    end
    end 
    
    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      selected_artist = gets.chomp
      
     if Artist.find_by_name(selected_artist) && selected_artist != nil 
    Artist.find_by_name(selected_artist).songs.each_with_index do |song, index| 
         puts "#{index + 1}. #{song.name} - #{song.genre.name}" 
      end
    end 
#      artist_search = Artist.all.collect do |item|
#        item.name
#      end 
#        if artist_search.include?(selected_artist)
        # what needs to happen in order for expression to run? - check if artist is included in song
          # this should search for name property equal to the string the user entered 
          # if selected_artist == artist's name then run expression below
          # how will you make selected_artist == artist's name -
      # artist search will return an array of artists from all of the artists in the library 
      # iterate over array and only puts/print the songs by that artist
      # search through songs array (Song.all) to find songs by artist
      # only return songs by selected_artists - how can I check for selected artists in a loop when selected artists is a local variable?
      
    end


  
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  end