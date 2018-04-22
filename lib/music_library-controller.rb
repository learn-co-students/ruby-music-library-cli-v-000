require 'pry'
class MusicLibraryController
  def initialize(file_path = './db/mp3s' )
    @path = file_path
    file = MusicImporter.new(file_path)
    file.import
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
    input = gets.strip.downcase
    call unless input == "exit"

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
      end
  end

   def list_songs
       songs = Song.all.sort_by.each{|song| song.name}
       songs.each.with_index(1){ |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

   def list_artists
      artists = Artist.all.sort_by.each{ |artist| artist.name}
      artists.each.with_index(1){ |artist, index| puts "#{index}. #{artist.name}"}
   end

   def list_genres
     genres = Genre.all.sort_by.each{ |genre| genre.name}
     genres.each.with_index(1){ |genre, index| puts "#{index}. #{genre.name}"}
   end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     artist = gets.strip
     songs = Song.all.select{|song| song.artist.name == artist}.sort_by.each{ |song| song.name}
     songs.each.with_index(1){ |song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     genre = gets.strip
     songs = Song.all.select{|song| song.genre.name == genre}.sort_by.each{ |song| song.name}
     songs.each.with_index(1){ |song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.to_i
    songs = Song.all.sort_by.each{|song| song.name}
    if songs[number -1] != nil && number != 0
      puts "Playing #{songs[number-1].name} by #{songs[number-1].artist.name}"
      #binding.pry
    end
  end
end
