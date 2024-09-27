require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
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
    # puts "What would you like to do?"
    input = ""
    while input != "exit" do
      puts "What would you like to do?"
      input = gets.strip
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
      end
    end
  end

  # CLI Methods
  def list_songs
    counter = 1
    songs = Song.all.uniq.sort! { |a, b| a.name <=> b.name }
    songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter +=1
    end
  end

  def list_artists
    counter = 1
    artists = Artist.all.sort! { |a, b| a.name <=> b.name }
    artists.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    genres = Genre.all.sort! { |a, b| a.name <=> b.name }
    genres.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    if Artist.find_by_name(artist_name)
      artist = Artist.find_by_name(artist_name)
      songs = artist.songs.sort! { |a, b| a.name <=> b.name }
      counter = 1
      songs.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter +=1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    if Genre.find_by_name(genre_name)
      genre = Genre.find_by_name(genre_name)
      songs = genre.songs.sort! { |a, b| a.name <=> b.name }
      counter = 1
      songs.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    songs = Song.all.uniq.sort! { |a, b| a.name <=> b.name }
    if (1..songs.length).include?(input)
      puts "Playing #{songs[input - 1].name} by #{songs[input - 1].artist.name}"
    end
  end

end
