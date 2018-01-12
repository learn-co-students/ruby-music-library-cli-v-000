require 'pry'

class MusicLibraryController
  attr_accessor :path
  # attr_reader :sorted_songs

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    # @all_songs = Song.all.sort_by(&:name)
  end


  # `each_with_index` and `sort`
  def list_songs
    Song.all.sort_by(&:name).each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.chomp
    counter = 1
    Song.all.sort_by(&:name).each do |song|
      if song.artist.name == artist_input
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.chomp
    counter = 1
    Song.all.sort_by(&:name).each do |song|
      if song.genre.name == genre_input
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    num_input = gets.chomp.to_i
    Song.all.sort_by(&:name).each_with_index do |song, index|
      if (index+1) == num_input
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
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
    user_input = gets.chomp
    if user_input == 'list songs'
      self.list_songs
    elsif user_input == 'list artists'
      self.list_artists
    elsif user_input == 'list genres'
      self.list_genres
    elsif user_input == 'list artist'
      self.list_songs_by_artist
    elsif user_input == 'list genre'
      self.list_songs_by_genre
    elsif user_input == 'play song'
      self.play_song
    elsif user_input == 'exit'
    else
      call
    end
  end
end
