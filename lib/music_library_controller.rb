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
    all_songs = (Song.all).sort_by {|obj| obj.name}
    songs_array = Array.new
    obj_count = 1

    all_songs.each do |song|
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

  def list_artists
    all_artists = (Artist.all).sort_by {|obj| obj.name}
    artist_array = Array.new
    obj_count = 1

    all_artists.each do |artist|
      artist = artist.name
      artist_array << "#{obj_count}. #{artist}"
      obj_count += 1
    end

    artist_array.each do |artist|
      puts artist
    end
  end

  def list_genres
    all_genres = (Genre.all).sort_by {|obj| obj.name}
    genre_array = Array.new
    obj_count = 1

    all_genres.each do |genre|
      genre = genre.name
      genre_array << "#{obj_count}. #{genre}"
      obj_count += 1
    end

    genre_array.each do |genre|
      puts genre
    end
  end
end
