
require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
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

    result = ""
    until result == "exit"
    result = gets.chomp
    end
  end

  def list_songs
    song_list = Song.all.sort {|x,y| x.name <=> y.name }
      song_list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
  end

  def list_artists
    artist_list = Artist.all.sort {|x,y| x.name <=> y.name}
      artist_list.each.with_index(1) do |artist, index|
        puts "#{index}. #{artist.name}"
      end
  end

  def list_genres
    genres_list = Genre.all.sort {|x,y| x.name <=> y.name}
      genres_list.each.with_index(1) do |genre, index|
        puts "#{index}. #{genre.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    result = ""
    result = gets.chomp
  end
end
