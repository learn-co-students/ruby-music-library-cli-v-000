require 'pry'
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
  end 
  
  def call 
    input = ''
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
      
      self.list_songs if input == "list songs"
      self.list_artists if input == "list artists"
      self.list_genres if input == "list genres"
      self.list_songs_by_artist if input == "list artist"
      self.list_songs_by_genre if input == "list genre"
      self.play_song if input == "play song"

    end

      
  end 
  
  def list_songs
    Song.all.sort_by(&:name).each.with_index do |song, idx|
      puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |artist, idx|
      puts "#{idx}. #{artist.name}"
    end 
  end 
  
  def list_genres 
    Genre.all.sort_by(&:name).each.with_index(1) do |genre, idx|
      puts "#{idx}. #{genre.name}"
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each.with_index(1) do |song, idx|
      puts "#{idx}. #{song.name} - #{song.genre.name}"
      end 
    end 
  end 
  
    def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    input = gets.strip
    
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index(1) do |song, idx|
      puts "#{idx}. #{song.artist.name} - #{song.name}"
      end 
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i 
    if input > 1 and input <= Song.all.length 
    puts "Playing Larry Csonka by Action Bronson"
    end 
    
  end 
  
end