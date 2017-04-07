require 'pry'


class MusicLibraryController
  attr_accessor :path
  attr_reader :response

  def initialize(path='./db/mp3s')
    self.path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      "Welcome to your music library..."
      "What would you like to do?"
      input = gets.chomp
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        songs_by_artist
      when "list genre"
        songs_by_genre
      when "play song"
        play_song
      else
        puts "See you later!"
      end
    end
  end

  def songs
    songs = Song.all.sort {|a, b| a.artist.name <=> b.artist.name}
    songs.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each do |a|
      puts "#{a.name}"
    end
  end

  def genres
    Genre.all.each do |g|
      puts "#{g.name}"
    end
  end

  def songs_by_artist
    puts "Which artist would you like to see?"
    artist_input = gets.chomp
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |song|
        puts "#{artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def songs_by_genre
    puts "Which genre would you like to see?"
    genre_input = gets.chomp
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    play_input = gets.to_i
    song = Song.all[play_input-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
