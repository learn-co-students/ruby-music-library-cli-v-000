require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    # binding.pry
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.strip
    case user_input
    when "list songs"
      list songs
    when "list artists"
      list artists
    when "list genres"
      list genres
    when "list artist"
      list artist
    when "list genre"
      list genre
    when "play song"
      play song
    else
      exit
    end
  end
end
