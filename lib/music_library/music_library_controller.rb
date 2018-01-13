require 'pry'
# accepts one argument, the path to the MP3 files to be imported
# creates a new MusicImporter object, passing in the 'path' value
# the 'path' argument defaults to './db/mp3s
# invokes the #import method on the created MusicImporter object

class MusicLibraryController

  attr_accessor

  def initialize(path = './db/mp3s')
    # @path = path
    @library = MusicImporter.new(path)
    @library.import
  end

  def call
    # asks the user for input
    # loops and asks for user input until they type in exit
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.strip until user_input = exit
  end



  def list_songs
      Song.all.sort { |a, b| a.name <=> b.name }.each_with_index { |song, index| binding.pry; puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end 
end
