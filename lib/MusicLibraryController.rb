require 'pry'
class MusicLibraryController
  attr_accessor :importer

  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    importer.import
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

    command = ""
    while command != "exit"
      puts "What would you like to do?"
      command = gets.chomp

      case command
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

  def list_songs
    Song.all.sort_by{|s| s.name}.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by{|a| a.name}.each_with_index{|a, i| puts "#{i+1}. #{a.name}"}
  end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each_with_index{|g, i| puts "#{i+1}. #{g.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    if artist = Artist.find_by_name(artist)
      sorted_songs = artist.songs.sort_by{|s| s.name}.each_with_index{|s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    if genre = Genre.find_by_name(genre)
      sorted_songs = genre.songs.sort_by{|s| s.name}.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    song_list = Song.all.sort_by{|s| s.name}
    if (1..Song.all.length).include?(song_number)
      song = song_list[song_number-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
