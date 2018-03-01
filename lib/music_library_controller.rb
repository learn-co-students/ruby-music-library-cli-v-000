require 'pry'

class MusicLibraryController
  attr_accessor :path, :files
  
  def initialize(path ='./db/mp3s')
    @path = path
    @files = MusicImporter.new(path).import
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
    
    input = gets.strip
    
    while input != "exit"
      input = gets.strip
    end
  end
  
  def list_songs
    list = []
    Song.all.each {|file| list << file}
    uni = list.uniq { |file| file.name }
    list = uni.sort_by {|file| file.name }
    list.each_with_index do |file, index| 
      puts "#{index + 1}. #{file.artist.name} - #{file.name} - #{file.genre.name}"
    end
  end
  
  def list_artists
    list = []
    Artist.all.collect {|file| list << file.name}
    list.sort.each_with_index do |file, index| 
      puts "#{index + 1}. #{file}"
    end
  end
  
  def list_genres
    list = []
    Genre.all.collect {|file| list << file.name}
    list.sort.each_with_index do |file, index| 
      puts "#{index + 1}. #{file}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    chosen = Artist
    alpha = []
    
    Artist.all.each do |file|
      if input == file.name
        chosen = file   #type: Artist
        alpha = chosen.songs.sort_by {|file| file.name } #type array
        
        alpha.each_with_index do |file, index| 
          puts "#{index + 1}. #{file.name} - #{file.genre.name}"
        end
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
 
    chosen = Genre
    alpha = []
    
    Genre.all.each do |file|
      if input == file.name
        chosen = file   #type: Genre
        alpha = chosen.songs.sort_by {|file| file.name } #type array
        
        alpha.each_with_index do |file, index| 
          puts "#{index + 1}. #{file.artist.name} - #{file.name}"
        end
      end
    end  
 
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    list_songs
    
    list = []
    Song.all.each {|file| list << file}
    uni = list.uniq { |file| file.name }
    list = uni.sort_by {|file| file.name }
    
    if input > 0 && input < list.length
      song = list[input+1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
    
end