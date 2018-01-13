require 'pry'
class MusicLibraryController
  attr_accessor :path, :song, :genre, :artist

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    menu
    selector
  end

  def menu
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def selector
    input = gets.strip
    until input == "exit" do
      input = gets.strip
    end
  end

  def list_songs
    # Song.all.each.with_index(1) do |song, index|
    #   puts "#{index}. #{song}"
    # end
  end

  def list_artists
  end

  def list_genres
  end

  def list_songs_by_artist
  end

  def list_songs_by_genre
  end

  def play_song
  end

end
