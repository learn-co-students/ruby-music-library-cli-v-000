require 'pry'
class MusicLibraryController 
  
  # accepts an optional path to the library of MP3 files, defaulting to ./db/mp3s/
  # instantiate a MusicImporter object
  
  attr_accessor :path, :files
  
  def initialize(path="./db/mp3s")
    @path = path
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

    input = gets.strip.downcase
    if input != "exit"
      self.call
    end
  end
  
  def list_songs
    alpha = Song.all.map.sort_by { |song| song.name } # sorts
    num = [] # new array to hold subarray artist, song name, genre strings
    alpha.map do |song|
      num << [song.artist.name, song.name, song.genre.name]
    end
    num.each_with_index do |name, index| 
      puts "#{index + 1}. #{name.join(" - ")}"
    end
  end
  
  def list_artists
    
  end
  
  def list_genres
  
  end
  
  def list_songs_by_artist
    
  end
  
  def list_songs_by_genre
    
  end
  
  def play_song
    
  end
  
end