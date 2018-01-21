require 'pry'

class MusicLibraryController

# accept optional path, with a default
# instantiate a MusicImporter object > it will use this to import songs into the library
# Add a call method to ask for user input

  attr_reader :path

  def initialize (path = "./db/mp3s")
    @path = path
    object = MusicImporter.new(path)
    object.import
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


    user_input = gets.chomp
binding.pry
      until user_input == "exit"
        user_input
        break
      end
  end

end
