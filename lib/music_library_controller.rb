require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
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
     input = " "

     until input == "exit"
       puts "What would you like to do?"
       input = gets.strip
       #binding.pry

       case input
       when "list songs"
         list_songs
       when "list artist"
         list_songs_by_artist
       when "list genre"
         list_songs_by_genre
       when "play song"
         play_song
       when "list genres"
         list_genres
       when "list artists"
         list_artists
       end

     end
   end

   def list_songs
     Song.all.sort_by!{ |song| song.name.downcase }
     Song.all.each_with_index do |song, i|
       puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
   end

   def list_artists
     Artist.all.sort_by!{ |artist| artist.name.downcase }
     Artist.all.each_with_index do |artist, i|
       puts "#{i+1}. #{artist.name}"
     end
   end

   def list_genres
     Genre.all.sort{ |genre1, genre2| genre1.name <=> genre2.name }.each.with_index(1) do |genre, i|
       puts "#{i}. #{genre.name}"
     end
   end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     input = gets.chomp
     artist = Artist.find_by_name(input)
     if artist
       artist.songs.sort{ |song1, song2| song1.name <=> song2.name }.each_with_index do |song, i|
         puts "#{i+1}. #{song.name} - #{song.genre.name}"
       end
     else
       nil
     end
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     input = gets.chomp
     genre = Genre.find_by_name(input)
     if genre
       genre.songs.sort{ |song1, song2| song1.name <=> song2.name }.each_with_index do |song, i|
         puts "#{i+1}. #{song.artist.name} - #{song.name}"
       end
     else
       nil
     end
   end

   def play_song
     list = Song.all.sort_by!{ |song| song.name }
     puts "Which song number would you like to play?"
     song = gets.chomp.to_i
     if (1..Song.all.length).include?(song)
        file = list[song - 1]
        puts "Playing #{file.name} by #{file.artist.name}"
     else
        nil
     end
   end

end
