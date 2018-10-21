require "pry"

class MusicLibraryController 
  attr_accessor :path 
  
  def initialize(path="./db/mp3s")
    @path = path 
    new_MusicImporter_object = MusicImporter.new(path)
    new_MusicImporter_object.import
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
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end 
  end

    
  def list_songs
      songs_sorted = Song.all.sort_by do |song|
        song.name
      end
      songs_sorted.each_with_index  do |song,index|
        puts "#{index + 1}." + " " + "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
   
  def list_artists 
    artists_sorted = Artist.all.sort_by do |artist|
        artist.name
      end
      artists_sorted.each_with_index  do |artist,index|
        puts "#{index + 1}." + " " +  "#{artist.name}"
      end
    end
    
    def list_genres
      genres_sorted = Genre.all.sort_by do |genre|
        genre.name
      end
      genres_sorted.each_with_index  do |genre,index|
        puts "#{index + 1}." + " " +  "#{genre.name}"
      end
    end
  
   def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    input = gets.chomp
    
    if artist = Artist.find_by_name(input)
       songs_sorted = artist.songs.sort_by do |song|
        song.name
      end
      
    songs_sorted.each.with_index(1) do |song,index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
    end
   
    def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    
    if genre = Genre.find_by_name(input)
       genres_sorted = genre.songs.sort_by do |genre|
        genre.name
      end
      
    genres_sorted.each.with_index(1) do |genre,index|
        puts "#{index}. #{genre.artist.name} - #{genre.name}"
      end
    end
  end
 
 
 def play_song
    puts "Which song number would you like to play?"
    songs_sorted = Song.all.uniq.sort_by {|s| s.name} 
  
    input = gets.strip
    #if (input > 0) && (input <= list_of_songs.size)
    #if (input >= 1) && (input <= list_of_songs.size)
   
    if input.to_i.between?(1, Song.all.length)
      song = songs_sorted[input.to_i - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
 
  
  #def play_song
   # puts "Which song number would you like to play?"
    #input = gets.strip 
    #songs_sorted = Song.all.uniq.sort_by {|s| s.name} 

#    if input.to_i.between?(1, songs_sorted.length)
      
     
 #       puts "Playing #{song.name} by #{song.artist.name}"
  #    end 
    
#  end 

   
     # songs_sorted.each do |song|
        #    if input.to_i == song 
   
end




