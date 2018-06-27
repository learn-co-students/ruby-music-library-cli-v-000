require './config/environment.rb'
require 'pry'

class MusicLibraryController
  include Concerns::MLInit
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    input = ""
    until input == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
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
    Song.put_list
  end
  
  def list_artists
    Artist.put_list
  end
  
  def list_genres
    Genre.put_list
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.get_name(gets.chomp)
    artist.put_list unless artist == nil
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.get_name(gets.chomp)
    genre.put_list unless genre == nil
  end
  
  def play_song
    song_list = Song.sort_by_name
    puts "Which song number would you like to play?"
    song = song_list[gets.chomp.to_i - 1]
    puts "Playing #{song.name} by #{song.artist.name}" if song_list.length > num && num >= 0
  end
end