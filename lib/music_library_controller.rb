require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    new_stuff = MusicImporter.new(path)
    new_stuff.import
  end 
  
  def call 
    input = ""
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
     
    while input != "exit"
    input = gets.strip
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      # elsif input == "list genre"
      #   list_songs_by_genre
      # elsif input == "play song"
      #   play_song
      end 
    end 
  end 
  
  def list_songs
    array = Song.all 
    new_array = array.sort_by {|song| song.name}
    new_array = new_array.uniq 
    @counter = 1
    new_array.each do |song|
      puts "#{@counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      @counter += 1 
    end 
    new_array
  end 
  
  def list_artists
    array = Artist.all 
    new_array = array.sort_by {|artist| artist.name}
    new_array = new_array.uniq 
    counter = 1
    new_array.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1 
    end 
  end 
  
  def list_songs_with_genres(the_artist)
    array = Song.all 
    new_array = array.sort_by {|song| song.name}
    new_array.delete_if do |song|
      song.artist.name != the_artist
    end 
    counter = 1
    new_array.each do |song|
      # binding.pry 
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1 
    end 
  end 
  
  def list_artists_with_songs(the_genre)
    array = Song.all 
    new_array = array.sort_by {|song| song.name}
    new_array.delete_if do |song|
      song.genre.name != the_genre
    end 
    counter = 1
    new_array.each do |song|
      # binding.pry 
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1 
    end 
  end 
  
  def list_genres
  array = Genre.all 
    new_array = array.sort_by {|genre| genre.name}
    new_array = new_array.uniq 
    counter = 1
    new_array.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1 
    end 
  end 
  
  def valid_artist?(input)
    array = Artist.all
    new_array = []
    array.each do |artist|
      new_array << artist.name 
    end 
    if new_array.include?(input)
      true 
    else 
      false 
    end 
  end 
  
  def valid_song?(input)
    if input <= @new_array.length && input != 0
      true 
    else 
      false 
    end 
  end 
  
  def valid_genre?(input)
    array = Genre.all
    new_array = []
    array.each do |genre|
      new_array << genre.name 
    end 
    if new_array.include?(input)
      true 
    else 
      false 
    end 
  end 
  
  def list_songs_by_artist
    input = ""
    puts "Please enter the name of an artist:"
    input = gets.strip 
    if valid_artist?(input) == true 
      list_songs_with_genres(input)
    end 
  end 
  
  def list_songs_by_genre
    input = ""
    puts "Please enter the name of a genre:"
    input = gets.strip 
    if valid_genre?(input) == true 
      list_artists_with_songs(input)
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    array = Song.all 
    @new_array = array.sort_by {|song| song.name}
    @new_array = @new_array.uniq 
    # binding.pry 
    if valid_song?(input) == true
      puts "Playing #{@new_array[input - 1].name} by #{@new_array[input - 1].artist.name}"
    end 
  end 
  
  def library 
    MusicImporter.library
  end 
  
end 