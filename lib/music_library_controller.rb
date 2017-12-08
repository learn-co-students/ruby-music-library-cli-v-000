require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    until input == "exit"
      options
      input = gets.strip
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
  end

  def options
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


# ////////////////CLI METHODS//////////////////////////////////
  def list_songs
    Song.all.sort_by{|s| s.name}.each.with_index(1) do |s, i|
       puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
     end
  end

  def list_songs_for_play
    Song.all.sort_by{|s| s.name}.collect.with_index(1) do |s, i|
       "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
     end
  end

  def list_artists
    Artist.all.sort_by{|a| a.name}.each.with_index(1) do |a, i|
       puts "#{i}. #{a.name}"
     end
  end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each.with_index(1) do |g, i|
       puts "#{i}. #{g.name}"
     end
  end

  extend Concerns::Findable

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.sort_by{|song| song.name}.each.with_index(1) do |song, i|
          puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    if Genre.find_by_name(genre)
      Genre.find_by_name(genre).songs.sort_by{|song| song.name}.each.with_index(1) do |song, i|
          puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end


  def play_song
  puts "Which song number would you like to play?"

  input = gets.strip.to_i
  if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
