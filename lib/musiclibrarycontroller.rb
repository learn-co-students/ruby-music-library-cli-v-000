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
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      elsif user_input == "play song"
        play_song
      end
      puts "Invalid entry. Try again."
      user_input = gets.chomp
    end
  end

    def list_songs
      Song.all.uniq.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artists
      Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
        puts "#{index + 1}. #{artist.name}"
      end
    end

    def list_genres
      Genre.all.sort_by {|genre| genre.name}.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    artist = Artist.find_or_create_by_name(user_input)
    artist.songs.sort_by {|song| song.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
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
    puts "Which song number would you like to play?"
    user_input = gets.chomp
    if user_input.to_i > 0 && Song.all.uniq.sort_by {|song| song.name}.length >= user_input.to_i
      puts "Playing #{Song.all[user_input.to_i].name} by #{Song.all[user_input.to_i].artist.name}"
    end
  end
end
