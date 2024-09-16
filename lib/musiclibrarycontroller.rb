require 'pry'

class MusicLibraryController
  extend Concerns::Findable

  attr_accessor :path, :song, :artist, :genre

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
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

  def list_songs
    Song.all.sort {|song1, song2|song1.name <=> song2.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort {|artist1, artist2|artist1.name <=> artist2.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort {|genre1, genre2|genre1.name <=> genre2.name}.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    artist = Artist.find_by_name(input)
    if artist
      sorted_songs = artist.songs.sort do |a, b|
        a.name <=> b.name
      end

      sorted_songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    genre = Genre.find_by_name(input)
    if genre
      sorted_songs = genre.songs.sort do |a, b|
        a.name <=> b.name
      end

      sorted_songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i
    sorted_songs = Song.all.sort {|song1, song2|song1.name <=> song2.name}
    song = sorted_songs[input - 1]
    if input >= 1 && input <= sorted_songs.count
    puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
