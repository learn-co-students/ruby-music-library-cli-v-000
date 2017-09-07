require 'pry'
class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    importer.import
    # binding.pry
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
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    # we need to print out a list of songs alphabetized by name
    # "1. Thundercat - For Love I Come - dance"
    Song.sorted.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.sorted.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    Genre.sorted.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip    #"Michael Jackson"
    artist = Artist.find_by_name(input) #Artist object representing Michael jackson
    if artist
      artist.songs.sort_by{|song| song.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre
      genre.songs.sort_by{|s| s.name}.each.with_index(1) do |s, i|
        # binding.pry
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input.between?(1, Song.all.size)
      puts "Playing #{Song.sorted[input-1].name} by #{Song.sorted[input-1].artist.name}"
      # binding.pry

    end
  end
end
