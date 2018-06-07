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
    puts "What would you like to do?"
    input = gets.strip
    list_songs if input == 'list songs'
    list_artists if input == 'list artists'
    list_genres if input == 'list genres'
    list_songs_by_artist if input == 'list artist'
    list_songs_by_genre if input == 'list genre'
    play_song if input == 'play song'
    self.call unless input == "exit"
  end

  def list_songs
    list = Song.all.sort_by{ |song| song.name }
    list.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    list = Artist.all.sort_by{ |artist| artist.name }
    list.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    list = Genre.all.sort_by{ |genre| genre.name }
    list.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    input = Artist.all.detect{ |artist| artist.name == input}
    if input
      list = input.songs.sort_by{ |song| song.name }
      list.each_with_index do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    input = Genre.all.detect{ |genre| genre.name == input}
    if input
      list = input.songs.sort_by{ |song| song.name }
      list.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input <= Song.all.count
      song = Song.all.sort_by{ |song| song.name }[input -1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
