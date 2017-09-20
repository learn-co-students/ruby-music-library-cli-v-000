require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    @songs = MusicImporter.new(path).import
  end

  def call
    loop do
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
      if input == 'exit'
        break
      else
        controller(input)
      end
    end
  end

  def controller(input)
    case input
    when 'list songs'   then list_songs
    when 'list artists' then list_artists
    when 'list genres'  then list_genres
    when 'list artist'  then list_artist
    when 'list genre'   then list_genre
    when 'play song'    then play_song
    end
  end

  def list_songs
    songs_sorted_by_name.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def songs_sorted_by_name
    Song.all.sort_by { |song| song.name }
  end

  def list_artists
    artists_sorted_by_name.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def artists_sorted_by_name
    Artist.all.sort_by { |artist| artist.name }
  end

  def list_genres
    genres_sorted_by_name.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def genres_sorted_by_name
    Genre.all.sort_by { |genre| genre.name }
  end



end
