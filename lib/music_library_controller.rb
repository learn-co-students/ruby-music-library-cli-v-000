require 'pry'
class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Hi! Welcome to your music library. What would you like to do?"
      input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_artist
      elsif input == "list genre"
        list_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    puts "Which song would you like to play?"
    input = gets.chomp
    puts "Playing #{Song.all[input.to_i-1]}"
  end

  def list_artist
    puts "Which artist would you like to list songs for?"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    artist.songs.each do |s|
      puts "#{s}"
    end
  end

  def list_genre
    puts "Which genre would you like to list songs for?"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    genre.songs.each do |s|
      puts "#{s}"
    end
  end
end
