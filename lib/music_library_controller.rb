require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end # initialize



  def call

    user_input = ""

    until user_input == 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      "Please enter input:"
      user_input = gets.strip

      case user_input
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
      end # cases
    end # while
  end # call



  def list_songs
    songs = Song.all.sort_by{|song| song.name}
    songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end # each.with_index
  end # list_songs

  def list_artists
    artists = Artist.all.sort_by{|artist| artist.name}
    artists.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end # each.with_index
  end # list_artists

  def list_genres
    genres = Genre.all.sort_by{|genre| genre.name}
    genres.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end # each.with_index
  end # list_genres

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.strip

    if Artist.find_by_name(input_artist) != nil
      artist = Artist.find_by_name(input_artist)
      artist_songs = artist.songs.sort_by{|song| song.name}
      artist_songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end # each.with_index
    end # if input_artist != nil
  end # list_songs_by_artist

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_genre = gets.strip

    if Genre.find_by_name(input_genre) != nil
      genre = Genre.find_by_name(input_genre)
      genre_songs = genre.songs.sort_by {|song| song.name}
      genre_songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
        end # each.with_index
    end # if input_genre != nil
  end # list_songs_by_genre

  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i - 1

    if (1..Song.all.size).detect{|index| index == song_num}
      song = Song.all.sort_by{ |song| song.name}[song_num]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end # play_song

end # class MusicLibraryController
