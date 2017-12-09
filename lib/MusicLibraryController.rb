require 'pry'

class MusicLibraryController
  attr_accessor :path, :song, :name

  @@files = []
  @@files_hash = {}

  def initialize(path = "./db/mp3s")
    @path = path
    new = MusicImporter.new(path)
    new.import
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

    input = gets until input == "exit"

  end

  #CLI Methods

  def list_songs
    Song.all.sort_by!{|i| i.name}
    count = 1
    Song.all.each do |i|
      puts "#{count}. #{i.artist.name} - #{i.name} - #{i.genre.name}"
      count += 1
    end
  end

  def list_artists
    Artist.all.sort_by!{|i| i.name}
    count = 1
    Artist.all.each do |i|
      puts "#{count}. #{i.name}"
      count += 1
    end
  end

  def list_genres
    Genre.all.sort_by!{|i| i.name}
    count = 1
    Genre.all.each do |i|
      puts "#{count}. #{i.name}"
      count += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    if Song.all.any?{|i| i.artist.name == artist_name}
      count = 1
      Song.all.collect{|i| i.artist.name == artist_name}.sort_by!{|i| i.name}.each do |i|
        puts "#{count}. #{i.name} - #{i.genre.name}"
        count += 1
      end
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    puts "genre_name"
  end
#    binding.pry
#    count = 1
#    Song.all.collect{|i| i.genre.name == genre_name}.sort_by!{|i| i.name}.each do |i|
#      puts "#{count}. #{i.name} - #{i.genre.name}"
#      count += 1
#    end
#  end

  def play_song
    self.list_songs
    puts "Which song number would you like to play?"
  end


end
