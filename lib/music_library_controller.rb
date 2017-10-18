require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = nil
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
    sorted_by_song_name = Song.all.sort{|a, b| a.name <=> b.name}
    sorted_by_song_name.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_by_artist_name = Artist.all.sort{|a, b| a.name <=> b.name}
    sorted_by_artist_name.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    sorted_by_genre = Genre.all.sort{|a, b| a.name <=> b.name}
    sorted_by_genre.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      sorted_artist_songs = artist.songs.sort{|a, b| a.name <=> b.name} #a,b are from songs array
      sorted_artist_songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      sorted_genre_songs = genre.songs.sort{|a, b| a.name <=> b.name}
      sorted_genre_songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i-1
    sorted_by_song_name = Song.all.sort{|a, b| a.name <=> b.name}
    #binding.pry
    if input.between?(0, sorted_by_song_name.length-1)
      puts "Playing #{sorted_by_song_name[input].name} by #{sorted_by_song_name[input].artist.name}"
    end
  end

end
