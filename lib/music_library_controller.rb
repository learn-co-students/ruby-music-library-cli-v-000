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

    action = gets.strip

    if action != "exit"
      self.call
    end
  end

  # CLI Methods

  def list_songs
    sorted_songs = Song.all.sort_by { |song| song.name }
    sorted_songs.each_with_index do |song, i|
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

end
