require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
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
    until input == "exit"
      puts "What would you like to do?"
      input = gets.chomp

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
  end

  def list_songs
    counter = 1
    Song.all.sort_by { |song| song.name }.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    Artist.all.sort_by { |artist| artist.name }.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    Genre.all.sort_by { |genre| genre.name }.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.all.detect{ |artist| artist.name == input }
      counter = 1
      artist.songs.sort_by{|song| song.name }.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.all.detect{ |genre| genre.name == input }
      counter = 1
      genre.songs.sort_by{|song| song.name }.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if Song.all.size > input - 1 && input > 0
      counter = 1
      Song.all.sort_by { |song| song.name }.each do |song|
        if input == counter
          puts "Playing #{song.name} by #{song.artist.name}"
        end
        counter += 1
      end
    end
  end

end
