require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music = MusicImporter.new(path)
    music.import
  end

  def call
    input = ""
    until input == "exit"
      puts "Welcome to the Music Library"
      puts "What would you like do do? (Options: list songs, list artists, list genres, play song, list artist, list genre)"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def songs
    Song.all.each_with_index do |song, index|
      #binding.pry
      puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index do |artist, index|
      #binding.pry
      puts "#{index.to_i + 1}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each_with_index do |genre, index|
      puts "#{index.to_i + 1}. #{genre.name}"
    end
  end

  def play_song
    puts "What song number would you like to listen to?"
    song_name = gets.strip
    song = Song.all[song_name.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "What artist would you like to see a list of songs for?"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song, index|
        puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre would you like to see a list of songs for?"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre.songs.each do |song, index|
        puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

  end

end
