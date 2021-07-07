require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = MusicImporter.new(path).import
  end

  def call
    user_input = ""
    until user_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
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
      end

    end
  end

  def list_songs
    Song.all.sort! {|a, b| a.name <=> b.name}
    Song.all.each_with_index do |song, index|
      puts "#{index+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort! {|a, b| a.name <=> b.name}
    Artist.all.each_with_index do |artist, index|
      puts "#{index+=1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort! {|a, b| a.name <=> b.name}
    Genre.all.each_with_index do |genre, index|
      puts "#{index+=1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if Artist.find_by_name(user_input) # how to change string into artist variable ??
      # has to be a better way to refractor this code??
      artist_songs = Artist.find_by_name(user_input).songs.sort! {|a, b| a.name <=> b.name}
      artist_songs.each_with_index do |song, index|
        puts "#{index+=1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if Genre.find_by_name(user_input)
      genre_songs = Genre.find_by_name(user_input).songs.sort! {|a, b| a.name <=> b.name}
      genre_songs.each_with_index do |song, index|
        puts "#{index+=1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i
    # binding.pry
    if user_input > 0 && user_input <= Song.all.size
      song = Song.all.sort! {|a, b| a.name <=> b.name}
        puts "Playing #{song[user_input-=1].name} by #{song[user_input].artist.name}" # come back to figure out why -=1 and nothing pull the right song??
    end
  end
end
