require 'pry'
class MusicLibraryController
  attr_accessor :path
  attr_reader :artist, :song, :genre

  def initialize(path = "./db/mp3s")
    controller = MusicImporter.new(path)
    controller.import
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
    # until gets.strip == "exit"
    #   gets.strip
    #   call
    gets.strip
    if gets.strip != "exit" then call
    end
  end

  def list_songs
    songlist = []
    Song.all.each {|x| songlist << x}
    songlist.sort_by! {|x| x.name}
    songlist.each_with_index do |song_name, index|
        puts "#{index + 1}. #{song_name.artist.name} - #{song_name.name} - #{song_name.genre.name}"
      end
  end
end
