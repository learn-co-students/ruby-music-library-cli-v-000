require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call

    input = ""

    while input != "exit"
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
    end

  #"1. Thundercat - For Love I Come - dance"
  #"2. Real Estate - Green Aisles - country"
    def list_songs
      #binding.pry
      song_objects = Song.all.sort_by {|a| a.name}
      song_objects.each.with_index(1) do |a, i|
        puts "#{i}. #{a.artist.name} - #{a.name} - #{a.genre.name}"
      end
    end

    def list_artists

    end 

  end



end
