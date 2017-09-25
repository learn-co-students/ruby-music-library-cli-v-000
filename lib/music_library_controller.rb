require_relative './music_library_cli_methods.rb'

class MusicLibraryController
  include CLIMethods
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
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
    input?
  end

  def input?
    puts "What would you like to do?"
    input = gets.chomp
    unless input == "exit"
      case input
      when "play song" then play_song
      when "list songs" then list_songs
      when "list genres" then list_genres
      when "list artists" then list_artists
      when "list genre" then list_songs_by_genre
      when "list artist" then list_songs_by_artist
      else input?
      end
    end
  end
end
