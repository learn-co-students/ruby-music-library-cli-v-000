require 'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    list_controls

    input = nil

    until input == 'exit'
      puts "What would you like to do?"
      input = gets.strip

      case input

      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      when 'list controls'
        self.list_controls
      end
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by { |song| song.name }
    song_number = 1
    sorted_songs.each do |song|
      puts "#{song_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      song_number += 1
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by { |artist| artist.name }
    artist_number = 1
    sorted_artists.each do |artist|
      puts "#{artist_number}. #{artist.name}"
      artist_number += 1
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by { |genre| genre.name }
    genre_number = 1
    sorted_genres.each do |genre|
      puts "#{genre_number}. #{genre.name}"
      genre_number += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    if artist
      sorted_songs = artist.songs.sort_by { |artist| artist.name }
      song_number = 1
      sorted_songs.each do |song|
        puts "#{song_number}. #{song.name} - #{song.genre.name}"
        song_number += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    if genre
      sorted_songs = genre.songs.sort_by { |genre| genre.name }
      song_number = 1
      sorted_songs.each do |song|
        puts "#{song_number}. #{song.artist.name} - #{song.name}"
        song_number += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip
    if song_number.to_i >= 1 && song_number.to_i <= Song.all.count
      sorted_songs = Song.all.sort_by { |song| song.name }
      song = sorted_songs[song_number.to_i - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

  def list_controls
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
  end
end
