require 'pry'
class MusicLibraryController
  def initialize(path = "./db/mp3s")
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
    begin
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
    end until input == 'exit'
  end

  def list_songs
    sorted_songs = Song.all.sort do |first, second|
      first.name <=> second.name
    end
    sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    sorted_songs
  end

  def list_artists
    sorted_artists = Artist.all.sort do |first, second|
      first.name <=> second.name
    end
    sorted_artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort do |first, second|
      first.name <=> second.name
    end
    sorted_genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_or_create_by_name(input)
    sorted_songs = artist.songs.each.sort do |first, second|
      first.name <=> second.name
    end
    sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_or_create_by_name(input)
    sorted_songs = genre.songs.each.sort do |first, second|
      first.name <=> second.name
    end
    sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    input = input.to_i
    sorted_songs = Song.all.sort do |first, second|
      first.name <=> second.name
    end
    num_songs = sorted_songs.count

    if input.between?(1,num_songs)
      puts "Playing #{sorted_songs[input-1].name} by #{sorted_songs[input-1].artist.name}"
    end
  end
end
