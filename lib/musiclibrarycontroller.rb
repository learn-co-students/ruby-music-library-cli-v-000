require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts ("#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}")
    end
  end

  def list_artist
    Artist.all.each_with_index do |artist, index|
      puts ("#{artist.name}")
    end
  end

  def list_genres
    Genre.all.each_with_index do |genre, index|
      puts ("#{genre.name}")
    end
  end

  def play_song
    Song.all.each_with_index do |song, index|
        puts ("Playing #{song.artist.name} - #{song.name} - #{song.genre.name}")
    end
  end

  def find_artists_songs
    puts "enter an artist"
    input_artist = gets.strip
    Artist.all.each do |artist|
      if artist.name == input_artist
        artist.songs.each do |song|
          puts ("#{song.artist.name} - #{song.name} - #{song.genre.name}")
        end
      end
    end
  end

  def find_genres_songs
    puts "enter a genre"
    input_genre = gets.strip
    Song.all.each_with_index do |song, index|
      if song.genre.name == input_genre
        puts ("#{song.artist.name} - #{song.name} - #{song.genre.name}")
      end
    end
  end

  def call
    input = ""
    while input != 'exit'
      puts "Welcome to your music library"
      puts "What would you like to do ?"
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artist
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        find_artists_songs
      when "list genre"
        find_genres_songs
      end
    end
  end


end
