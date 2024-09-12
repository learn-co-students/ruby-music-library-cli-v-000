require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
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

  def sort_by_songs
    list = Song.all
    list.sort_by do |song|
      "#{song.name} #{song.artist.name}"
    end
  end

  def list_songs
    sort_by_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def sort_by_artists
    list = Artist.all
    list.sort_by do |artist|
      "#{artist.name}"
    end
  end

  def list_artists
    sort_by_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def sort_by_genres
    list = Genre.all
    list.sort_by do |genre|
      "#{genre.name}"
    end
  end

  def list_genres
    sort_by_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
  	puts "Please enter the name of an artist:"
  	user_input = gets.strip
      if artist = Artist.find_by_name(user_input)
        artist.songs.sort_by { |song| song.name }.each.with_index do |song, index|
          puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end
      else
      	puts "Please enter the name of an artist:" until user_input != nil
      end
  end


  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
      if genre = Genre.find_by_name(user_input)
        genre.songs.sort_by { |song| song.name }.each.with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name}"
        end
      else
        puts "Please enter the name of a genre:" until user_input != nil
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    songs = Song.all
    songs.sort_by {|song| song.name}.each_with_index do |song, index|
      if index + 1 == number
        puts "Playing #{song.name} by #{song.artist.name}"
      else
        nil
      end
    end
  end


end
