require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
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
   input = gets.strip

    if input != "exit"
      call
    end
 end

 def list_songs
   i = 0
   sorted_array = Song.all.sort_by do |song|
    song.name
   end

   sorted_array.each do |song|
     puts "#{i+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
 end

 def list_artists
   i = 0
   sorted_array = Artist.all.sort_by do |artist|
     #binding.pry
     artist.name
   end

   sorted_array.each do |artist|
     puts "#{i+=1}. #{artist.name}"
   end
 end

 def list_genres
   i = 0
   sorted_array = Genre.all.sort_by do |genre|
     genre.name
   end

   sorted_array.each do |genre|
     puts "#{i+=1}. #{genre.name}"
   end
 end

 def list_songs_by_artist
   i = 0
   puts "Please enter the name of an artist:"
   input = gets.strip

   #artist_array = Song.all.collect do |artist|
     #if artist.name == input
       #artist.name
     #end
     #binding.pry
   #end
 end

end
