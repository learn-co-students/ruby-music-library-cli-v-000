require 'pry'

class MusicLibraryController
  @@all = []
  
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call 
    # welcomes the user
    # asks user for input
    # keeps asking for input until user types exit 
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
  
  def list_songs_by_artist
    # promts user to enter an artist 
    # accepts user input get.strip 
    # prints all songs by an artist in numbered list alphabetically by Song
    # does nothing is there is no artist match 
    
    puts "Please enter the name of an artist:"
    artist_input = gets.strip 
    if artist = Artist.find_by_name(artist_input)
      artist_songs_sorted = artist.songs.sort_by do |song|
        song.name 
      end
      artist_songs_sorted.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre}"
      end
    end
  end
  
  def list_songs_by_genre
    # promts user to enter an genre 
    # accepts user input get.strip 
    # prints all songs by a genre in numbered list alphabetically by Song
    # does nothing is there is no genre match
    
    puts "Please enter the name of a genre:"
    genre_input = gets.strip 
    if genre = Genre.find_by_name(genre_input)
      genre_songs_sorted = genre.songs.sort_by do |song|
        song.name 
      end
      genre_songs_sorted.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist} - #{song.name}"
      end
    end
  end
  
  def play_song 
    # prompts user to choose song from list in #list_songs method 
    # accepts user input get.strip 
    # after valid input 'plays' the matching song 
    # does not puts anything if no match is made 
    # checks that user input was between 1 and total number of songs in library 
    
    puts "Which song number would you like to play?"
    
    song_list = Song.all.sort_by{|song| song.name}
    
    index = gets.chomp.to_i
    adjusted_index = index - 1
    value_at_index = song_list[adjusted_index]
    
    
    if adjusted_index >= 0 && adjusted_index < song_list.size 
      song = value_at_index
      puts "Playing #{song.name} by #{song.artist}"
    end
  end
  
  def list_artists 
    sorted_artist = Artist.all.sort_by do |artist|
      artist.name 
    end
    sorted_artist.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist}"
    end
  end
  
  def list_genres 
    sorted_genre = Genre.all.sort_by do |genre|
      genre.name 
    end
    sorted_genre.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre}"
    end
  end
  
  def list_songs 
    sorted_song = Song.all.sort_by do |song|
      song.name
      # binding.pry
    end
    
    sorted_song.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
    
end