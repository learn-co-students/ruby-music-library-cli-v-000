require 'pry'

class MusicLibraryController
  attr_accessor :path, :musicimporter

  def initialize(path = "./db/mp3s")
  self.musicimporter = MusicImporter.new(path)
  self.musicimporter.import
  end


  def call
    user_input = nil
    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp.downcase
      case user_input
      when 'list songs'
        list_songs
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
      end
    end
  end

  def list_songs
    new_array = self.musicimporter.files.uniq
    sorted_array = new_array.sort_by do |e|
      e.split(" - ")[1]
    end
    sorted_array.each_with_index do |v, i|
      puts "#{i + 1}. #{v.chomp(".mp3")}"
    end
  end


  def list_artists
    artist_array = Artist.all.collect do |e|
      e.name
    end
    artist_array = artist_array.sort
    artist_array.each_with_index do |v, i|
      puts "#{i + 1}. #{v}"
    end
  end

  def list_genres
    genre_array = Genre.all.collect do |e|
      e.name
    end
    genre_array = genre_array.sort
    genre_array.each_with_index do |v, i|
      puts "#{i + 1}. #{v}"
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      user_artist = gets.chomp
      artist_song_array = []
      Artist.all.find do |a|
        if a.name.downcase == user_artist.downcase
          a.songs.collect do |e|
            artist_song_array << e.name + " - " + e.genre.name
          end
        end
      end
      artist_song_array = artist_song_array.sort
      artist_song_array.each_with_index do |v, i|
        puts "#{i + 1}. #{v}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_genre = gets.chomp
    genre_song_array = []
    Genre.all.find do |g|
      if g.name == user_genre.downcase
        g.songs.collect do |e|
          genre_song_array << e.artist.name + (" - ") + e.name
        end
      end
    end
    sorted_genre_song_array = genre_song_array.sort_by do |e|
      e.split(" - ")[1]
    end
    sorted_genre_song_array.each_with_index do |v, i|
      puts "#{i + 1}. #{v}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_song_number = gets.chomp.to_i
    total_songs = Song.all.count
    playing_array = []
    if user_song_number > 0 && user_song_number <= total_songs
      sorter = Song.all.sort_by do |e|
        e.name
      end
      sorter.each_with_index do |v, i|
        if user_song_number == i + 1
          puts "Playing #{v.name} by #{v.artist.name}"
        end
      end
    end
  end
end
