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
   #binding.pry
   if input != "exit"
    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
    elsif input == "list genres"
      list_genres
    elsif input == "list artist"
      list_songs_by_artist
    elsif input == "list genre"
      list_songs_by_genre
    elsif input == "play song"
      play_song
    else
      call
    end
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

   if artist_object = Artist.find_by_name(input)
     songs = artist_object.songs.sort_by do |song|
       song.name
     end
     songs.each_with_index do |song, i|
       puts "#{i + 1}. #{song.name} - #{song.genre.name}"
     end
   end
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
   input = gets.strip

   if genre_object = Genre.find_by_name(input)
     songs = genre_object.songs.sort_by do |song|
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
