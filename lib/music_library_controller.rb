require 'pry'

class MusicLibraryController
  attr_accessor :path


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

    input = gets.strip

    if input != "exit"
      self.call
    end

    case input
    when "list songs"
      self.list_songs
    when "list artists"
      self.list_artists
    when "list genres"
      self.list_genres
    when "list artist"
      self.list_songs_by_artist
    when "list genre"
      self.list_songs_by_genre
    when "play song"
      self.play_song
    end

  end

  # CLI Methods

  def sorted_songs
    Song.all.sort_by { |song| song.name }
  end

  def list_songs
    self.sorted_songs.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by { |artist| artist.name }
    sorted_artists.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by { |genre| genre.name }
    sorted_genres.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist_songs = artist.songs.sort_by { |song| song.name }
      artist_songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre_songs = genre.songs.sort_by { |song| song.name }
      genre_songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number > 0 && song_number <= self.sorted_songs.length
      puts "Playing #{self.sorted_songs[song_number-1].name} by #{self.sorted_songs[song_number-1].artist.name}"
    end
  end

end
