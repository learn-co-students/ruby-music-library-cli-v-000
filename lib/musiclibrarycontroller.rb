require 'pry'
require_relative '../config/environment'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @music = MusicImporter.new(path)
    @music.import
  end

  def call
    counter = 1
    input = ""
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
    until counter == 4 || input == "exit"
      case input
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
      else

      end
      puts "What would you like to do?"
      input = gets.strip
      counter += 1
    end

  end

  def list_songs
    counter = 1
    songs = []
    Song.all.each do |e|
      song = []
      song << e.artist.name
      song << e.name
      song << e.genre.name
      if !songs.include?(song)
        songs << song
      end
    end
    sorted_songs = songs.sort_by{|k|k[1]}

    sorted_songs.each do |e|
      puts "#{counter}. #{e[0]} - #{e[1]} - #{e[2]}"
      counter += 1
    end
    sorted_songs
  end

  def list_artists
    counter = 1
    artists = []
    Artist.all.each do |e|
      if !artists.include?(e.name)
        artists << e.name
      end
    end
    sorted_artists = artists.sort

    sorted_artists.each do |e|
      puts "#{counter}. #{e}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    genres = []
    Genre.all.each do |e|
      if !genres.include?(e.name)
        genres << e.name
      end
    end
    sorted_genres = genres.sort

    sorted_genres.each do |e|
      puts "#{counter}. #{e}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    songs = Song.all.select {|i| i.artist.name == input}
    sorted_songs = []
    songs.each do |e|
      # binding.pry
      song = []
      song << e.name
      song << e.genre.name
      if !sorted_songs.include?(song)
        sorted_songs << song
      end
    end
    counter = 1
    sorted_songs = sorted_songs.sort_by{|k| k[0]}
    sorted_songs.each do |song|
      puts "#{counter}. #{song[0]} - #{song[1]}"
      counter += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    songs = Song.all.select {|i| i.genre.name == input}
    sorted_songs = []
    songs.each do |e|
      song = []
      song << e.artist.name
      song << e.name
      if !sorted_songs.include?(song)
        sorted_songs << song
      end
    end
    counter = 1
    sorted_songs = sorted_songs.sort_by{|k| k[1]}
    sorted_songs.each do |song|
      puts "#{counter}. #{song[0]} - #{song[1]}"
      counter += 1
    end

  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets
    input = input.to_i
    if 6 > input && input > 0
      songs = []
      Song.all.each do |e|
        song = []
        song << e.artist.name
        song << e.name
        song << e.genre.name
        if !songs.include?(song)
          songs << song
        end
      end
      sorted_songs = songs.sort_by{|k|k[1]}
      played_song = sorted_songs[input - 1]
      puts "Playing #{played_song[1]} by #{played_song[0]}"
    end
  end
end
