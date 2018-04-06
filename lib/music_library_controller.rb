require_relative '../config/environment'
require 'pry'
class MusicLibraryController

  extend Concerns::Findable
  include CLI_Methods

  def initialize(path="./db/mp3s") #importing these songs by default unless another path is specified
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call #starts the CLI applicaton when called on an instance of MusicLibraryController in the bin file
    input = nil

    while input != "exit" #if user didn't type exit, puts out this oldschool main menu

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip #what do you want, user?

      case input #ok, if you typed in one of the following...
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

end
