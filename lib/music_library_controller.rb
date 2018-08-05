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
    array = Dir.glob("#{@path}/*.mp3")
    array = array.collect do |file|
      file = file.split(/[\/.]/)[-2]
      file
    end
    array.sort_by! do |s|
     s.split(' - ')[1]
    end
    array
    array.each do |element|
      puts "#{counter}. #{element}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    array = Dir.glob("#{@path}/*.mp3")
    array = array.collect do |file|
      file = file.split(/[\/.]/)[-2]
      file = file.split(" - ")[0]
      file
    end
    array.sort!
    array = array.uniq
    #binding.pry
    array.each do |el|
      puts "#{counter}. #{el}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    array = Dir.glob("#{@path}/*.mp3")
    array = array.collect do |file|
      file = file.split(/[\/.]/)[-2]
      file = file.split(" - ")[2]
      file
    end
    array.sort!
    array = array.uniq
    #binding.pry
    array.each do |el|
      puts "#{counter}. #{el}"
      counter += 1
    end
  end

  def list_songs_by_artist
    counter = 1
    puts "Please enter the name of an artist:"
    input = gets.strip
    path = Dir.glob("#{@path}/*.mp3")
    filename = path.collect do |file|
      file = file.split(/[\/.]/)[-2]
      file = file.split(" - ")
    end
    artists = filename.collect do |file|
      file[0]
    end
    #binding.pry
    if artists.include?(input)
      songs = filename.collect do |el|
        if el.include?(input)
          [el[1], el[2]]
        end
      end
      binding.pry
      puts "#{counter}. #{songs[1]} - #{songs[2]}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    array = Dir.glob("#{@path}/*.mp3")
    array = array.collect do |file|
      file = file.split(/[\/.]/)[-2]
      file = file.split(" - ")[2]
      file
    end
    #if array.include?(input)

    #end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    array = Dir.glob("#{@path}/*.mp3")
    array = array.collect do |file|
      file = file.split(/[\/.]/)[-2]
      file = file.split(" - ")[2]
      file
    end
    #if array.include?(input)

    #end
  end

end
