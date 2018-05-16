require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
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
      answer = gets
      if answer == 'list songs'
        list_songs
      elsif answer == 'list artists'
        list_artists
      elsif answer == 'list genres'
        list_genres
      elsif answer == 'list artist'
        list_songs_by_artist
      elsif answer == 'list genre'
        list_songs_by_genre
      elsif answer == 'play song'
        play_song
      else
        loop until answer == 'exit'
    end
  end

  def list_songs
   list = Song.all.sort_by{|i| i.name}
   list.each do |i|
     puts "#{list.find_index(i) + 1}. #{i.artist.name} - #{i.name} - #{i.genre.name}"
   end
  end


  def list_artists
   list = Artist.all.sort_by{|i| i.name}
   list.each do |i|
     puts "#{list.find_index(i) + 1}. #{i.name}"
   end
  end

  def list_genres
    list = Genre.all.sort_by{|i| i.name}
    list.each do |i|
      puts "#{list.find_index(i) + 1}. #{i.name}"
    end
   end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     answer = gets
     if answer = Artist.find_by_name(answer)
       list = answer.songs.sort_by{|i| i.name}
       list.each do |i|
         puts "#{list.find_index(i) + 1}. #{i.name} - #{i.genre.name}"
       end
     end
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     answer = gets
     if answer = Genre.find_by_name(answer)
       list = answer.songs.sort_by{|i| i.name}
       list.each do |i|
         puts "#{list.find_index(i) + 1}. #{i.artist.name} - #{i.name}"
       end
     end
   end

   def play_song
     puts "Which song number would you like to play?"
     answer = gets.to_i
     if answer > 0
       song = songs_sorted[answer - 1]
       puts "Playing #{song.name} by #{song.artist.name}" unless song == nil
     end
   end

   def songs_sorted
     list = Song.all.sort_by{|i| i.name}
     list
   end

end
