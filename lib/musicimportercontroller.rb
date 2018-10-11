require 'pry'
require_relative '../config/environment.rb'

class MusicLibraryController
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
    @path = path 
    controller = MusicImporter.new(path)
    controller.import 
  end 
  
  def call
    
     user_input = ""
     
    while user_input != "exit" do 
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.strip 
    
    if user_input == 'list songs'
      list_songs
    elsif user_input == 'list artists'
      list_artists
    elsif user_input == 'list genres'
      list_genres
    elsif user_input == 'list artist'
      list_songs_by_artist
    elsif  user_input == 'list genre'
      list_songs_by_genre
    elsif user_input == 'play song'
      play_song
    end 
    
    
    end 
  end 
  
   def list_songs
     list = Song.all.uniq.sort {|a, b| a.name <=> b.name}
     list.each_with_index do |song, i|
       puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
     end
   end 
 
   def list_artists
     list = Artist.all.uniq.sort {|a,b| a.name <=> b.name} 
     list.each_with_index do |artist, i|
       puts "#{i + 1}. #{artist.name}" 
     end
  end 
  
  def list_genres 
     list = Genre.all.uniq.sort {|a,b| a.name <=> b.name} 
     list.each_with_index do |genre, i|
       puts "#{i + 1}. #{genre.name}" 
     end
  end 


 def list_songs_by_artist
    puts "Please enter the name of an artist:"

    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
 end


def list_songs_by_genre
  
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
 end
 
 def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      list = Song.all.uniq.sort {|a, b| a.name <=> b.name}
      song = list[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song 
  end

end 