require 'pry'
class MusicLibraryController
  @@songs_listed = []

  attr_accessor :music_importer

  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
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
    user_entry = gets

    while user_entry != "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_entry = gets
    end
  end

  def list_songs
    songs_listed = Song.all.sort { |x, y| x.name <=> y.name }
    songs_listed.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
  artists_list = Artist.all.sort { |x, y| x.name <=> y.name }
  artists_list.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres_list = Genre.all.sort { |x, y| x.name <=> y.name }
    genres_list.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.chomp
    artist = Artist.find_by_name(name)
    if artist
      songs_list = artist.songs.sort { |x, y| x.name <=> y.name }
      songs_list.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.chomp
    genre = Genre.find_by_name(name)
    if genre
      songs_list = genre.songs.sort { |x, y| x.name <=> y.name }
      songs_list.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_entry = gets.strip.to_i
    if user_entry >= 1 && user_entry <= Song.all.size
      songs_list = Song.all.sort { |x, y| x.name <=> y.name }
      song = songs_list[user_entry -1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
