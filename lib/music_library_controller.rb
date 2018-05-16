require "pry"
<<<<<<< HEAD


class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
    @path = path
  end

  def call
    welcome
    input = gets.chomp
    while input != "exit"
      welcome
      input = gets.chomp
    end
  end

  def welcome
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
=======
require_relative './music_importer.rb'

class MusicLibraryController < MusicImporter
  attr_accessor :path

  def initialize(MusicImporter(path))
    @path = path
  end
>>>>>>> 77ffc05dc482d04d800e7747db7dc4c967b1d0b8
end
