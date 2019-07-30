require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    # @path = path

    @new_instance = MusicImporter.new(path).import


    # binding.pry
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

    until gets == ("exit")
    end
    # binding.pry
  end

  def list_songs
      @new_instance.each_with_index {|song, index| puts "#{index + 1}. #{song.gsub(".mp3", "")}"}
    binding.pry
  end
end
