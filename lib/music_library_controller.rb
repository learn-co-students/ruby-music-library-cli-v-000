require "pry"

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
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
    input = ""
    while input != "exit"
      puts "What would you like to do?"
      input = gets.strip
    end
  end

  def list_songs
    counter = 1
    song_list = Song.all.sort_by do |song|
      song.name
    end
    song_list.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    artist_list = Artist.all.sort_by do |artist|
      artist.name
    end
    artist_list.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by do |genre|
      genre.name
    end
    genre_list.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist_songs = artist.songs.sort_by do |song|
        song.name
      end
      artist_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre_songs = genre.songs.sort_by do |song|
        song.name
    end
      genre_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      binding.pry
      song = Song.all.sort{|a, b| a.name <=> b.name}[input - 1]
    end
    puts "Playing #{song.name} by #{song.artist.name}"
  end

end
