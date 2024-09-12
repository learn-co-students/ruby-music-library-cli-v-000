require "pry"
class MusicLibraryController

  attr_accessor :library

  def initialize(file_path = './db/mp3s')
    @library = MusicImporter.new(file_path)
    library.import
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
    elsif input == "exit"
    else
      call
    end

  end

  def valid_calls
     valid = ["list songs", "list artists", "list genres", "list artist", "list genre", "play song", "exit"]
  end

  def list_songs
    counter = 0
    Song.all.sort{ |first, second| first.name <=> second.name }.each do |s|
      counter += 1
      puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    counter = 0
    Artist.all.sort{ |first, second| first.name <=> second.name }.each do |a|
      counter += 1
      puts "#{counter}. #{a.name}"
    end
  end

  def list_genres
    counter = 0
    Genre.all.sort{ |first, second| first.name <=> second.name }.each do |g|
      counter += 1
      puts "#{counter}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    check_name = gets.strip
    counter = 0
    if artist = Artist.find_by_name(check_name)
      artist.songs.sort{ |first, second| first.name <=> second.name }.each do |s|
        counter += 1
        puts "#{counter}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    check_name = gets.strip
    counter = 0
    if genre = Genre.find_by_name(check_name)
      genre.songs.sort{ |first, second| first.name <=> second.name }.each do |g|
        counter += 1
        puts "#{counter}. #{g.artist.name} - #{g.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if Song.all.length >= input && input >= 1
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end
      puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
