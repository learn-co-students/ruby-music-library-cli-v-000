require 'pry'

class MusicLibraryController
  attr_accessor :path 
  
  def initialize(path='./db/mp3s')
    @path = path 
    MusicImporter.new(path).import 
  end 
  
  def call 
    input = ""
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
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
      else 
        nil 
      end
  end 
end 
  
  def list_songs 

    Song.all.sort {|a, b| a.name <=> b.name}.each_with_index {|song, index| puts "#{index +1}. #{song.artist.name.gsub("./spec/fixtures/other_mp3s/", "")} - #{song.name} - #{song.genre.name}"}
  end 
 
  def list_artists 
    Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index {|artist, index|  puts "#{index +1}. #{artist.name.gsub("./spec/fixtures/other_mp3s/", "")}"}
  end 
  
  def list_genres
     Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index {|genre, index| puts "#{index +1}. #{genre.name}"}
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist =  Artist.find_by_name(input)
     artist.songs.sort_by(&:name).each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index(1) {|song, index|
      puts "#{index}. #{song.artist.name} - #{song.name}"}
    end 
  end 
  
def play_song 
    puts "Which song number would you like to play?"
    input = gets.strip.to_i  
    if input > 0 && input <= Song.all.length 
    song = Song.all.sort_by(&:name)[input - 1]
   puts "Playing #{song.name} by #{song.artist.name}" if song 
  end

  end 
end 
