require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path=path
    new_path = MusicImporter.new(@path)
    new_path.import
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
    end #case

    until user_input == "exit"
      user_input = gets.chomp
    end

  end

  def list_songs
    song = Song.all
    song1 = song.sort {|a, b| a.name <=> b.name }
    song1.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artist = Artist.all
    artist1 = artist.sort { |a, b| a.name <=> b.name }
    artist1.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genre = Genre.all
    genre1 = genre.sort { |a, b| a.name <=> b.name }
    genre1.each_with_index do | genre, index |
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp

    artist = Artist.find_by_name(user_input)
    if artist
    artist.songs.sort {|a, b| a.name <=> b.name }.each.with_index(1) { |song, index|
      puts "#{index}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp

    genre = Genre.find_by_name(user_input)
      if genre
      genre.songs.sort { |a, b| a.name <=> b.name }.each.with_index(1) { | song, index |
        puts "#{index}. #{song.artist.name} - #{song.name}" }
      end
    #end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp

    input = user_input.to_i - 1
    list = []

    unless input < 0 || input > 5
      Song.all.sort {|a, b| a.name <=> b.name }.each_with_index { |song, index|
         list << "Playing #{song.name} by #{song.artist.name}"}
         puts list[input] unless list[input] == nil
      end
  end #play_song method




end #class
