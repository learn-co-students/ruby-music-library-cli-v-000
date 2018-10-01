require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
    while (user_input = gets.chomp) != "exit"
      case
        when user_input == "list songs"
           list_songs
         when user_input == "list artists"
           list_artists
         when user_input == "list genres"
           list_genres
         when user_input == "list artist"
           list_songs_by_artist
         when user_input == "list genre"
           list_songs_by_genre
         when user_input == "play song"
           play_song
         end
       end
    end


  def list_songs
    Song.all.sort_by {|song| song.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
        puts "#{index + 1}. #{artist.name}"
      end
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
     artist = gets.chomp
     if artist = Artist.find_by_name(artist)
       artist.songs.sort_by {|song| song.name}.each_with_index do |song, index|
         puts "#{index + 1}. #{song.name} - #{song.genre.name}"
       end
     end
   end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
    genre = gets.chomp
    if genre = Genre.find_by_name(genre)
      genre.songs.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
 end

 def play_song
     puts "Which song number would you like to play?"
     number = gets.chomp.to_i
     song = Song.all.sort_by {|song| song.name}[number - 1] if number > 0 && number < Song.all.length
     puts "Playing #{song.name} by #{song.artist.name}" if song
 end
end