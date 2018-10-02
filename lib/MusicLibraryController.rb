 require 'pry'
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
    
      if action != "exit"
        call 
      elsif action == "list songs"
        list_songs
      elsif action == "list artists"
        list_artists
      elsif action == "list genres"
        list_genres
      elsif action == "list artist"
        list_songs_by_artist
      end 
    end 
  
  def list_songs 
    alphabetize(Song).each_with_index do |song, index|
      puts "#{index + 1}. #{song_formatter(song)}"
    end 
  end 
  
  def list_artists
    
     alphabetize(Artist).each_with_index do |artist, index|  
      puts "#{index + 1}. #{artist.name}"
    end 
  end 
  
  def list_genres
    
    alphabetize(Genre).each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end 
  end 
   
 
  def list_songs_by_artist
     
    puts "Please enter the name of an artist:"
      
    name = gets.chomp
    
     if name == Artist.find_by_name(name)
        Artist.songs.each_with_index do |song|
          puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end 
      end 
  end 
 
  def alphabetize(input) 
    input.all.sort_by{|sorted|sorted.name}
  end 
  
 
  def song_formatter(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}" 
  end 
  
  def artist_formatter(artist)
    "#{song.name} - #{song.genre.name}" 
  end 
    
  end 


