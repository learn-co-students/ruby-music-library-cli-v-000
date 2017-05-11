require "pry"
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    musicimporter = MusicImporter.new(path)
    musicimporter.import
  end

  def call
     user_input = ""
     puts "Welcome to Your Music Library!"
     puts "What would you like to do?"
     while user_input != "exit"
       user_input = gets.strip
       case user_input
       when "list songs"
         songs
       when "list artists"
         artists
       when "list genres"
         genres
       when "list artist"
         list_artist
       when "list genre"
         list_genre
       when "play song"
         play_song
       end
     end
   end

   def artists
     Artist.all.each.with_index do |artist, index|
       puts "#{index+=1}. #{artist.name}"
     end
   end

   def genres
     Genre.all.each.with_index(1) do |genre, index|
       puts "#{index+=1}. #{genre.name}"
     end
   end

   def list_artist
     puts "For which artist would you like to list songs?"
     input = gets.strip
     if artist = Artist.find_by_name(input)
       artist.songs.each do |song|
         puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
       end
     end
   end

   def list_genre
     puts "For which genre would you like to list songs?"
     input = gets.strip
     if genre = Genre.find_by_name(input)
       genre.songs.each do |song|
         puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
       end
     end
   end

   def play_song
     puts "What song number would you like to play?"
     song_input = gets.strip
     puts "Playing #{Song.all[song_input.to_i-1].artist.name} - #{Song.all[song_input.to_i-1].name} - #{Song.all[song_input.to_i-1].genre.name}"
   end

   def songs
     Song.all.each_with_index do |song, index|
       puts "#{index+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
   end
 end
