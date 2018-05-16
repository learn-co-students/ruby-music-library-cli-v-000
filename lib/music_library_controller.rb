require "pry"


class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @filenames = MusicImporter.new(path).import
    @path = path
  end

  def call
    input = ""
    while input != "exit"
      welcome
      input = gets.chomp
      case input
        when "list songs"
          puts list_songs
        when "list artists"
          puts list_artists
        when "list genres"
          puts list_genres
        when "list artist"
          puts list_songs_by_artist
        when "list genre"
          puts list_songs_by_genre
        when "play song"
          puts play_song
      end
    end
  end

  def welcome
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def list_songs
    files_sorted =@filenames.sort {|x, y| x.split(" - ")[1] <=> y.split(" - ")[1]}
    files_sorted.each_with_index {|f, index| puts "#{index + 1}. #{f.gsub(".mp3", "")}"}
  end

  def list_artists
    #binding.pry
    list = Artist.all.sort {|x, y| x.name <=> y.name}.uniq
    list.each_with_index {|a, index| puts "#{index + 1}. #{a.name}"}
  end

  def list_genres
    #binding.pry
    list = Genre.all.sort {|x, y| x.name <=> y.name}.uniq
    list.each_with_index {|a, index| puts "#{index + 1}. #{a.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp

    artist = Artist.find_by_name(input)
    if artist != nil
      sorted_songs = artist.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre != nil
      sorted_songs = genre.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    #binding.pry
    puts "Which song number would you like to play?"
    input = gets.chomp

  end


end
