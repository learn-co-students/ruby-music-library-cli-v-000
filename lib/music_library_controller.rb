require 'pry'

class MusicLibraryController
  attr_reader :library

  def initialize(path = './db/mp3s')
    @library = MusicImporter.new(path)
    library.import
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
    input = gets.strip
    until input == "exit" do
      if input == "list songs"
        list_songs
        return
      elsif input == "list artists"
        list_artists
        return
      elsif input == "list genres"
        list_genres
        return
      elsif input == "list artist"
        list_songs_by_artist
        return
      elsif input == "list genre"
        list_songs_by_genre
        return
      elsif input == "play song"
        play_song
        return
      elsif input != "exit" || !valid_calls.include?(input)
        puts "What would you like to do?"
        input = gets.strip
      end
    end
  end


  def valid_calls
    valid = ["list songs", "list artists", "list genres", "list artist", "list genre", "play song", "exit"]
  end

  def list_songs
    counter = 0
    Song.all.sort_by{|s| s.name}.each.each do |s|
      counter += 1
      puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    counter = 0
    Artist.all.sort_by{|a| a.name}.each do |a|
      counter += 1
      puts "#{counter}. #{a.name}"
    end
  end

  def list_genres
    counter = 0
    Genre.all.sort_by{|g| g.name}.each do |g|
      counter += 1
      puts "#{counter}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    if Artist.find_by_name(artist_name)
      counter = 0
      Artist.find_by_name(artist_name).songs.sort_by{|s| s.name}.each do |s|
        counter += 1
        puts "#{counter}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genres_name = gets.strip
    if Genre.find_by_name(genres_name)
      counter = 0
      Genre.find_by_name(genres_name).songs.sort_by{|s| s.name}.each do |s|
        counter += 1
        puts "#{counter}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    total_songs = Song.all.count.to_i
    index_number = song_number - 1
    song = Song.all.sort_by{|s| s.name}[index_number]
    if song.class == Song && song_number.between?(1, total_songs)
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
