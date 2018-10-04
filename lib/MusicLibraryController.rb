class MusicLibraryController

  def initialize(path= './db/mp3s')
    MusicImporter.new(path).import
  end 
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    action = gets.chomp
    
    while action != "exit"
      if action == "list songs"
        list_songs
      elsif action == "list artists"
       list_artists
      elsif action == "list genres"
        list_genres
      elsif action == "list artist"
        list_songs_by_artist
      elsif action == "list genre"
        list_songs_by_genre
      elsif action == "play song"
        play_song
     end 
    
    action = gets.chomp
    end
  end 
  
  def list_songs
    formatter(Song)
  end 

  def list_artists
      formatter(Artist)
  end 
  
  def list_genres
    formatter(Genre)
  end 
 
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    list_by_formatter(Artist)
  end

  def play_song 
    puts "Which song number would you like to play?"
    song_choice = gets.chomp
    index_choice = song_choice.to_i - 1
    if index_choice.between?(0, Song.all.length - 1)
      alphabetize(Song).each_with_index do |song, index|
        if index == index_choice 
          puts "Playing #{song.name} by #{song.artist.name}"
        end 
      end 
    end
  end  
    
  
  def alphabetize(input) 
    input.all.sort_by{|sorted|sorted.name}
  end 
  
  def formatter(class_name)
    alphabetize(class_name).each_with_index do |title, index|
      if class_name != Song
        puts "#{index +1}. #{title.name}"
      else
        puts "#{index + 1}. #{title.artist.name} - #{title.name} - #{title.genre.name}"
      end 
    end 
 end 
 
 
   def list_songs_by_genre
    puts "Please enter the name of a genre:"
    list_by_formatter(Genre)
    end
 
 
  def list_by_formatter(class_name) 
    input_name = gets.chomp
    
    if class_name.find_by_name(input_name)
      input = class_name.find_by_name(input_name)
      input_songs = input.songs.sort_by{|song|song.name}
      
      input_songs.map.with_index do |song, index| 
        if class_name == Genre
          puts  "#{index + 1}. #{song.artist.name} - #{song.name}"
        elsif class_name == Artist
          puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end 
      end
    end
  end
end 

  


