require 'pry'

class MusicLibraryController
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :size

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
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
    user_input = gets.strip
    case user_input
      when "exit"
        "exit"
      when "list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      else
        puts "What would you like to do?"
      end
  end

  def list_songs
    count = 1
    song_list = Song.all.sort { |a, b|  a.name <=> b.name }
    song_list.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre}"
      count += 1
    end
    @size = song_list.size
  end

  def list_artists
    count = 1
    artist_list = Artist.all.sort { |a, b|  a.name <=> b.name }
    artist_list.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end

  def list_genres
    count = 1
    genre_list = Genre.all.sort { |a, b|  a.name <=> b.name }
    genre_list.each do |genre|
      puts "#{count}. #{genre.name}"
      count += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_selected = gets.strip
    artist_instance = Artist.find_or_create_by_name(artist_selected)
    count = 1
    artists_song_list = artist_instance.songs.sort { |a, b|  a.name <=> b.name }
    artists_song_list.each do |song|
      puts "#{count}. #{song.name} - #{song.genre}"
      count += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_selected = gets.strip
    genre_instance = Genre.find_or_create_by_name(genre_selected)
    count = 1
    genres_song_list = genre_instance.songs.sort { |a, b|  a.name <=> b.name }
    genres_song_list.each do |genre|
      puts "#{count}. #{genre.artist.name} - #{genre.name}"
      count += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_no = gets.strip.to_i
    song_list = Song.all.sort { |a, b|  a.name <=> b.name }
    size = song_list.size
    song_instance = song_list[song_no - 1]
    if song_instance != nil && (song_no > 0 && song_no <= size)
      puts "Playing #{song_instance.name} by #{song_instance.artist.name}"
    end
  end
end
