require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
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
    input = nil
    while input != "exit" do
      puts "What would you like to do?"
      input = gets.chomp
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
    songs = Song.all.sort_by {|song| song.name}
    songs.collect.with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    artists = Artist.all.sort_by {|artist| artist.name}
    artists.collect.with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
  end

  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}
    genres.collect.with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      sorted = artist.songs.sort_by {|song| song.name}
      sorted.each.with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      sorted = genre.songs.sort_by {|song| song.name}
      sorted.each.with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    songs = Song.all.sort_by {|song| song.name}
    if input >= 1 && input <= songs.size
      song = songs[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
