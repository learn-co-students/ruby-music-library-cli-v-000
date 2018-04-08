require 'pry'

class MusicLibraryController
  attr_reader :songs

  def initialize(path = './db/mp3s')
    @songs = MusicImporter.new(path).import
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
    loop do
      puts "What would you like to do?"
      input = gets.strip
      break if input == "exit"
    end
  end

  def list_songs
    memo = 1
    songs.sort_by { |song| song.name }.each do |song|
      puts "#{memo}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      memo += 1
    end
  end

  def list_artists
    artists = Artist.all.map { |artist| artist.name }.sort
    memo = 1
    artists.each do |artist|
      puts "#{memo}. #{artist}"
      memo += 1
    end
  end

  def list_genres
    genres = Genre.all.map { |genre| genre.name }.sort
    memo = 1
    genres.each do |genre|
      puts "#{memo}. #{genre}"
      memo += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets
    memo = 1
    Song.all.uniq.sort_by { |song| song.name }.map do |song|
      if song.artist.name == artist_input
        puts "#{memo}. #{song.name} - #{song.genre.name}"
        memo += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets
    memo = 1
    Song.all.uniq.sort_by { |song| song.name }.map do |song|
      if song.genre.name == genre_input
        puts "#{memo}. #{song.artist.name} - #{song.name}"
        memo += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets
    songs.sort_by { |song| song.name}.each_with_index do | song, index |
      song_number = "#{index + 1}"
      puts "Playing #{song.name} by #{song.artist.name}" if song_choice == song_number
    end

  end

end
