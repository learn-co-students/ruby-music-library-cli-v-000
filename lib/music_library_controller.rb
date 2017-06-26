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

 def sorted_songs
  Song.all.sort_by do |song|
    song.name
  end
 end

 def list_songs
   i = 0

   sorted_songs.each do |song|
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
   puts "Please enter the name of an artist:"
   input = gets.strip

   if artist_object = Artist.find_by_name(input) # return value is either an instance or nil
     songs = artist_object.songs.sort_by do |song|# sounds good do that here lol
       song.name
     end
     songs.each_with_index do |song, i| # |element, index|
       puts "#{i + 1}. #{song.name} - #{song.genre.name}"
     end
   end
   # binding.pry
   # find the artist
   # user the getter for the songs and list the song names
   # if the artist isn't found (conditionally), then you would say something to the effect
   # of artist not found or invalid artist name, and use recursion to keep your program going.
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
   input = gets.strip

   if genre_object = Genre.find_by_name(input) # return value is either an instance or nil
     songs = genre_object.songs.sort_by do |song|# sounds good do that here lol
       song.name
     end
     songs.each_with_index do |song, i| # |element, index|
       puts "#{i + 1}. #{song.artist.name} - #{song.name}"
     end
   end
 end

 def play_song
   puts "Which song number would you like to play?"
   index = gets.strip.to_i - 1

   if index.between?(0, sorted_songs.length - 1) && song = sorted_songs[index]
      puts "Playing #{song.name} by #{song.artist.name}"
   end
 end

end
