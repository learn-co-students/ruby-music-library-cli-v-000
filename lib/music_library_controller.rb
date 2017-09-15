require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
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
    input = gets.chomp
    until input === "exit"
      input = gets.chomp
    end
  end

  def list_songs
    # binding.pry
   sorted_songs = Song.all.uniq.sort_by {|song| song.name}
   sorted_songs.each_with_index(1) do |song, index|
     puts "#{index}. #{song.artist} - #{song.name} - #{song.genre}"
   end

  end

  def list_artists
    Artist.all.uniq.sort.each_with_index(1) do |song, index|
      puts "#{index}. #{song.artist} - #{song.name} - #{song.genre}"
    end
  end

  def list_genres
    Genre.all.uniq.sort.each_with_index(1) do |song, index|
      puts "#{index}. #{song.artist} - #{song.name} - #{song.genre.class}"
    end
  end

  def play_song
    input = gets.chomp
  end


end
