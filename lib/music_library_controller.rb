
require 'pry'

class MusicLibraryController
  # attr_accessor :musicimporter

  def initialize(path = './db/mp3s')
    @musicimporter = MusicImporter.new(path).import
  end


  def call
    act = ""

    until act == 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      act = gets.chomp


      case act
        when 'list songs'
          list_songs
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'list genre'
          list_songs_by_genre
        when 'list artist'
          list_songs_by_artist
        when 'play song'
            play_song
        end
    end
  end

  def list_songs
    sorted = Song.all.sort {|a,b| a.name <=> b.name}

    sorted.each_with_index {|s,i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }

  end

  def play_song
    puts "Which song number would you like to play?"
    n = gets.chomp.to_i
    unless (n == 0 || n > Song.all.count)

      # binding.pry
      chosen = Song.all.sort {|a,b| a.name <=> b.name}[n - 1]
      puts "Playing #{chosen.name} by #{chosen.artist.name}"
    end
  end


  def list_artists
    sorted = Artist.all.sort {|a,b| a.name <=> b.name}
    sorted.each_with_index {|a,i| puts "#{i+1}. #{a.name}"}
  end

  def list_genres
    sorted = Genre.all.sort {|a,b| a.name <=> b.name}
    sorted.each_with_index {|g,i| puts "#{i+1}. #{g.name}"}
  end

  def list_songs_by_artist

    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    artist = Artist.all.find {|a| a.name == artist_name}
    if artist
      sorted = artist.songs.sort {|a,b| a.name <=> b.name}
      sorted.each_with_index {|s,i| puts "#{i+1}. #{s.name} - #{s.genre.name}"}
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    genre = Genre.all.find {|g| g.name == genre_name}
    if genre
      sorted = genre.songs.sort {|a,b| a.name <=> b.name}
      sorted.each_with_index {|s,i| puts "#{i+1}. #{s.artist.name} - #{s.name}"}
    end
  end


end
