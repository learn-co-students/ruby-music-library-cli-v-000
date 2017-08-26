require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
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

  def list_songs
    sorted = Song.all.sort_by{|song| song.name}
    sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted = Artist.all.sort_by{|artist| artist.name}
    sorted.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    sorted = Genre.all.sort_by{|genre| genre.name}
    sorted.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end

  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    chosen_artist = gets.chomp.downcase
    sorted = Song.all.sort_by{|song| song.name}
    x = 0
    sorted.each do |song|
      if song.artist.name.downcase == chosen_artist
        puts "#{x += 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    chosen_genre = gets.chomp.downcase
    sorted = Song.all.sort_by{|song| song.name}
    x = 0
    sorted.each do |song|
      if song.genre.name.downcase == chosen_genre
        puts "#{x += 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i - 1
    if input >= 1 && input <= Song.all.count
      sorted = Song.all.sort_by{|song| song.name}
      sorted.each_with_index do |song, index|
        if index.to_i == input
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end
  end


end
