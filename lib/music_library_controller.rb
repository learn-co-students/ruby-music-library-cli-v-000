require "pry"


class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @filenames = MusicImporter.new(path).import
    @path = path
  end

  def call
    welcome
    input = gets.chomp
    while input != "exit"
      welcome
      input = gets.chomp
    end
  end

  def welcome
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def list_songs
    binding.pry
  end

  def list_artists

  end

  def list_genres

  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    puts "{list_artists}"
    input = gets.chomp
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
  end

end
