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
    when 'list artist'  then list_songs_by_artist
    when 'list genre'   then list_songs_by_genre
    when 'play song'    then play_song
    end
  end

  def list_songs
    songs_sorted_by_name.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def songs_sorted_by_name
    Song.all.sort_by {|song| song.name}
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

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    songs_and_genre_by_artist(artist_name)
  end

  def songs_and_genre_by_artist(artist_name)
    artist = Artist.find_by_name(artist_name)
    unless artist.nil?
      artist.songs.sort_by {|song| song.name}
      .each_with_index {|song, index| puts "#{index +1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    artist_name_and_songs_by_genre(genre_name)
  end

  def artist_name_and_songs_by_genre(genre_name)
    genre = Genre.find_by_name(genre_name)
    unless genre.nil?
      genre.songs.sort_by { |song| song.name }
      .each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number > 0 && song_number <= songs_sorted_by_name.length
      index       = song_number - 1
      song        = songs_sorted_by_name[index]
      song_name   = song.name
      artist_name = song.artist.name
      puts "Playing #{song_name} by #{artist_name}"
    end
  end



end
