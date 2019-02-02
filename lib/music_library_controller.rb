require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    self
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

    input = gets.strip.downcase
    if input != "exit"
      self.call
    end
  end
        #    case input
        #       when "list songs"
        #         self.call
        #       when "list artists"
        #         self.call
        #       when "list genres"
        #         self.call
        #       when "list artist"
        #         self.call
        #       when "list genre"
        #         self.call

def list_songs

    files = Dir.entries(self.path).keep_if { |file| file.match(/(mp3$)/)}
    binding.pry
    files.map
    files.each_with_index do |name, index|
      puts "#{index + 1}. #{name}"

    end
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


end #class MusicImporter end
