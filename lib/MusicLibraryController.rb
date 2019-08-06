require 'pry'

class MusicLibraryController
  attr_accessor :path, :song, :name

  @@files = []
  @@files_hash = {}

  def initialize(path = "./db/mp3s")
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
    command = " "
    while command != "exit"
      command = gets.strip
      case command
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end

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
    if Song.all.any?{|s| s.artist.name == artist_name}
      count = 1
      Song.all.each do |s|
        if s.artist.name == artist_name
          puts "#{count}. #{s.name} - #{s.genre.name}"
          count += 1
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    if Song.all.any?{|s| s.genre.name == genre_name}
      count = 1
      Song.all.each do |s|
        if s.genre.name == genre_name
          puts "#{count}. #{s.artist.name} - #{s.name}"
          count += 1
        end
      end
    end
  end
#    binding.pry
#    count = 1
#    Song.all.collect{|i| i.genre.name == genre_name}.sort_by!{|i| i.name}.each do |i|
#      puts "#{count}. #{i.name} - #{i.genre.name}"
#      count += 1
#    end
#  end

  def play_song
    puts "Which song number would you like to play?"
    songs_total = Song.all.count
    input = gets.to_i
    if 1 < input && input <= songs_total
      index = input - 1
      song_name = Song.all[index].name
      artist_name = Song.all[index].artist.name
      puts "Playing #{song_name} by #{artist_name}"
    end
  end


end
