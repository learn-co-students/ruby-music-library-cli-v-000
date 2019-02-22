require 'pry'
class MusicLibraryController
  
  attr_accessor :path, :music

  def initialize(path = './db/mp3s')
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
     input = nil 
     until input == 'exit'
      puts "What would you like to do?"
      input = gets
    end 
  end
  
  def list_songs
    unsorted_songs = Song.all 
    #file = MusicImporter.new(path).import
    #unsorted_songs = [] 
    #file.each do |song| 
      #unsorted_songs << Song.create_from_filename(song)
    #end 
      #binding.pry 
    sorted_songs = unsorted_songs.sort_by{ |song| song.name}
    number = 1 
    sorted_songs.each do |song|
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      number += 1
    end
  end
  
end 