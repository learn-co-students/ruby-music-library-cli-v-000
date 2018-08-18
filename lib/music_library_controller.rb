require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
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
    Song.all.sort { |a, b| a.name <=> b.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort { |a, b| a.name <=> b.name}.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort { |a, b| a.name <=> b.name}.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    songs = Song.find_by_name(input)
  #  binding.pry
    if songs != nil
      songs.artist.songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  #find_by_name
  #check to make sure it's there

  #list_songs_by_genre prints all songs by a particular genre in a numbered list (alphabetized by song name)
  #puts "#{i}. #{song.artist.name} - #{song.name}
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    Song.all.sort { |a, b| a.name <=> b.name}.each.with_index(1) do |songs, i|
      songs.artist.songs.each do |song|
        if song.artist.name == gets.strip
          puts "#{i}. #{song.artist.name} - #{song.name}"
        end
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input >= 1 && input < Song.all.length
      song = Song.all.sort { |a, b| a.name <=> b.name}[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

#  binding.pry
end
