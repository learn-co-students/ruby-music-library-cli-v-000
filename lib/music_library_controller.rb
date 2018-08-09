require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    #binding.pry
    files = MusicImporter.new(path)
    files.import
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
      else
        while input != "exit"
          puts "What would you like to do?"
          input = gets.strip
        end
    end
  end

  def list_songs
    counter = 1
    array = Song.all
    array = array.map do |song|
      [song.artist.name, song.name, song.genre.name]
    end
    array = array.sort_by! do |s|
      s[1]
    end
    array.each do |set|
      puts "#{counter}. #{set[0]} - #{set[1]} - #{set[2]}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    array = Artist.all
    array = array.map do |artist|
      artist.name
    end
    array = array.sort!
    array.each do |set|
      puts "#{counter}. #{set}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    array = Genre.all
    array = array.map do |genre|
      genre.name
    end
    array = array.sort!
    array.each do |set|
      puts "#{counter}. #{set}"
      counter += 1
    end
  end

  def list_songs_by_artist
    counter = 1
    puts "Please enter the name of an artist:"
    input = gets.strip

    array = Artist.all
    array = array.map do |artist|
      if artist.name == input
        artist.each do |song|
        end
      end
    end


  end

  def list_songs_by_genre
    counter = 1
    puts "Please enter the name of a genre:"
    input = gets.strip
    array = dir_helper.collect do |file|
      file = file.split(" - ")
      file
    end
    array.each do |set|
      if set.include? input
        puts "#{counter}. #{set[0]} - #{set[1]}"
        counter +=1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    input = input.to_i
    input -= 1
    el = list_songs[input]
    el = el.split(' - ')
    puts "Playing #{el[1]} by #{el[0]}"
  end

end
