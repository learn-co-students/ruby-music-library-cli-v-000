require_relative './concerns/findable.rb'
require 'pry'


class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = './db/mp3s')
    @path= path
    importer= MusicImporter.new(path)
    @importer = importer.import
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
    command = gets.strip
    if command != 'exit'
      call
    end
  end

  def list_songs
    songs = Song.all.sort {|x,y| x.name <=> y.name}
      x = 1
    songs.each do |song|
  #     puts "#{x}. #{song.name}"
  #     x += 1
  #   end
  # end

end