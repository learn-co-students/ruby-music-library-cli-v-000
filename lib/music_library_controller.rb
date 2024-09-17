
require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    result = ""
    while result != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    #binding.pry
    result = gets.strip

    case result
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
    song_list = Song.all.sort {|x,y| x.name <=> y.name }
      song_list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
  end

  def list_artists
    artist_list = Artist.all.sort {|x,y| x.name <=> y.name}
      artist_list.each.with_index(1) do |artist, index|
        puts "#{index}. #{artist.name}"
      end
  end

  def list_genres
    genres_list = Genre.all.sort {|x,y| x.name <=> y.name}
      genres_list.each.with_index(1) do |genre, index|
        puts "#{index}. #{genre.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    result = gets.chomp
    artist = Artist.find_by_name(result)
    if artist
     artists_songs = artist.songs.sort {|a,b| a.name <=> b.name}
        artists_songs.each_with_index do |song, i|
           puts "#{i+1}. #{song.name} - #{song.genre.name}"
        end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    result = gets.chomp
    genre = Genre.find_by_name(result)
    #binding.pry
    if genre
      genres_songs = genre.songs.sort {|a,b| a.name <=> b.name}
        genres_songs.each.with_index(1) do |song, i|
          puts "#{i}. #{song.artist.name} - #{song.name}"
        end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    result = gets.chomp

    songs_list = Song.all.sort {|a,b| a.name <=> b.name}
      songs_list.each.with_index(1) do |song, index|
        if result.to_i == index
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
   end
end
