require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path= './db/mp3s')
    @path = path
    new_song = MusicImporter.new(path)
    new_song.import
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
    input = gets.strip
    until input == "exit"
      puts "What would you like to do?"
      input = gets.strip
    end

    def list_songs
      songs = Song.all.each {|song| song.name}
      songs.sort {|a, b| a.name <=> b.name}

    end



  end


end
