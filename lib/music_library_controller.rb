require './config/environment.rb'
require 'pry'

class MusicLibraryController
  include Concerns::MLInit
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    super
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
        Songs.all.each{|song| puts song.name}
      end
    end
  end
end