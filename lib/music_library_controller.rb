require 'pry'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    @files_array = MusicImporter.new(path).import
  end
  
  def call
    call_input = ""
    until call_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."     
      puts "What would you like to do?"
      call_input = gets.chomp
      case call_input 
      when "list songs"
        list_songs
      when "list artists"
        list_artists    
      when "list genres"
        genres
      when "list artist"
        artist
      when "list genre"
        genre
      when "play song"
        play_song
      end
    end
  end
  
  def split_files_array
    @files_array.map {|file_string| file_string.split(Regexp.union([' - ', '.mp3']))}
  end
  
  def split_files_sort_by_song
    split_files_array.sort_by {|file_array| file_array[1]}
  end
  
  def list_songs
    counter = 1 
    while counter < @files_array.count do 
      split_files_sort_by_song.map do |file_array| 
        file_string = file_array.join(' - ')
        puts "#{counter}. #{file_string}"
        counter += 1
      end
    end
  end
  
  def list_artists
    counter = 1 
    while counter < @files_array.count do 
      artist_array = split_files_array.map {|file_array| file_array.first}.uniq.sort
      artist_array.each do |artist|
        puts "#{counter}. #{artist}"
        counter += 1
      end
    end
  end
  
  def list_genres
    counter = 1 
    while counter < @files_array.count do
      genre_array = split_files_array.map {|file_array| file_array.last}.uniq.sort
      genre_array.each do |genre|
        puts "#{counter}. #{genre}"
        counter += 1
      end
    end
  end
  
  def list_songs_by_artist
    artist = ""
    #puts "Please enter the name of an Artist:"
    artist = gets.chomp 
    counter = 1 
    while counter < @files_array.count do
      split_files_sort_by_song.select do |file_array| 
        if file_array[0] == artist
          puts "#{counter}. #{file_array[1]}"
          counter += 1
        end
      end
    end
  
  end

  def list_songs_by_genre
    
  end
  
  def play_song
    
  end
  
end