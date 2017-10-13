require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path ='./db/mp3s' )
    musicimporter = MusicImporter.new(path)
    musicimporter.import
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
    until user_input == "exit"
      user_input = gets.chomp
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      elsif user_input == "play song"
        play_song
      end
    end
  end
    def list_songs
      binding.pry
      Song.all.sort_by {|song| song.name}.each do |song|
        puts "#{Song.all.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artists
      Artist.all.sort_by {|artist| artist.name}.each do |artist|
        puts "#{Artist.all.index(artist) + 1}. #{artist.name}"
      end
    end

    def list_genres
      Genre.all.sort_by {|genre| genre.name}.each do |genre|
        puts "#{Genre.all.index(genre) +1}. #{genre.name}"
      end
    end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    artist = Artist.find_or_create_by_name(user_input)
    artist.songs.each do |song|
      puts "#{artist.songs.index(song) + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    genre = Genre.find_or_create_by_name(user_input)
    genre.songs.each do |song|
      puts "#{genre.songs.index(song) + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    songs = list_songs
    puts "Which song number would you like to play?"
    user_input = gets.chomp
    if 1 <= user_input.to_i <= songs.length
      puts "playing #{songs[user_input.to_i].name} by #{songs[user_input.to_i].artist.name}"
    end
  end
end
