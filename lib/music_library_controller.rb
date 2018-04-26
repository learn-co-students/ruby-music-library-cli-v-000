require "pry"
class MusicLibraryController
  attr_accessor :path, :MusicImporter
  
   def initialize(path = './db/mp3s')
    @path = path
    music = MusicImporter.new(path)
    music.import
  end
  
  def call 
    input = ""
    puts "Welcome to your music library!"
    while input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets
    end
  end
  
  def list_songs
    sorted_songs = Song.all.sort! {|x,y| x.name <=> y.name}
    sorted_songs.each_with_index {|val,index| puts "#{index+1}. #{val.artist.name} - #{val.name} - #{val.genre.name}"}
  end
  
  def list_artists
    sorted_artists = Artist.all.sort! {|x,y| x.name <=> y.name}
    sorted_artists.each_with_index {|val, index| puts "#{index+1}. #{val.name}"}
  end
  
  def list_genres
    sorted_genres = Genre.all.sort! {|x,y| x.name <=> y.name}
    sorted_genres.each_with_index {|val, index| puts "#{index+1}. #{val.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    artist = Artist.find_by_name(input)
    #binding.pry
    songs_sorted = artist.songs.sort_by do |x| 
      x.name
    end
    
    sorted_songs.each_with_index {|val, index| puts "#{index+1}. #{val.name}"}
    end
end
