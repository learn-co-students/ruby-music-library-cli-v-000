require 'pry'
class MusicLibraryController

  attr_accessor :path, :song, :artist, :genre, :musicimporter

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    #puts "Welcome To Your Awesome Music Library"#would be nice to greet user with thier name
    #user_input
    list_commands
  end

  def user_input
    #puts "Please choose from this list of options"
    input = gets.strip
  end

  def print_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_commands
    #puts "Please choose from this list of options"
    #user_input = gets.strip
    input = " "
  while input != "exit" do
    # puts "To list all of your songs, enter 'list songs'."
    #   puts "To list all of the artists in your library, enter 'list artists'."
    #   puts "To list all of the genres in your library, enter 'list genres'."
    #   puts "To list all of the songs by a particular artist, enter 'list artist'."
    #   puts "To list all of the songs of a particular genre, enter 'list genre'."
    #   puts "To play a song, enter 'play song'."
    #   puts "To quit, type 'exit'."
    #   puts "What would you like to do?"

    input = user_input
    case input
    when "list songs"
      list_songs
    #   binding.pry
    # end
    when "list artist"
      list_artists
    # when "list genres"
    #   list_genres
    # when "play song"
    #   play_song = "Playing #{song}"
    #
    # artist_songs = @artist.songs
    # genre_songs = @genre.songs
    # to_exit = exit
  end


    #list_commands until exit
  end



  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
     end
  end

  def list_artists
    Artist.all.each_with_index do |artist, index|
      puts "#{index = 1}. #{song.artist.name}"
    end
  end


end
