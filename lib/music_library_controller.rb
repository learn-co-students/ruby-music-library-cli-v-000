require 'pry'
require 'pp'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""

    until input == "exit"
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
  end

  # CLI Methods
  def list_songs
    songs_obj = (Song.all).sort_by {|obj| obj.name}
    songs_array = Array.new
    obj_count = 1

    songs_obj.each do |song|
      # binding.pry
      artist = song.artist.name
      genre = song.genre.name
      song_name = song.name
      songs_array << "#{obj_count}. #{artist} - #{song_name} - #{genre}"
      obj_count += 1
    end

    songs_array.each do |song|
      puts song
    end
  end
end
