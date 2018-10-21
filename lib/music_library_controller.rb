require_relative './concerns/findable.rb'
require 'pry'


class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = './db/mp3s')
    @path= path
    importer= MusicImporter.new(path)
    @importer = importer.import
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
    command = gets.strip
    if command == "list songs"
      list_songs
    elsif command == "list artists"
      list_artists
    elsif command == "list genres"
      list_genres
    elsif command == "list artist"  
      list_songs_by_artist
    elsif command == "list genre"
      list_songs_by_genre
    elsif command == "play song"
      play_song
    elsif command != 'exit'
      call
    end
  end

  def list_songs
    songs = Song.all.sort {|x,y| x.name <=> y.name}
    song_list = songs.each_with_index do |song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    song_list
  end

  def list_artists
    artists = Artist.all.sort {|x,y| x.name <=> y.name}
    artists.each_with_index do |artist,index|
      puts "#{index+1}. #{artist.name}"
    end
  end
  
  def list_genres
    genres = Genre.all.sort {|x,y| x.name <=> y.name}
    genres.each_with_index do |genre,index|
      puts "#{index+1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    art = gets.strip
    artist = Artist.find_by_name(art)
    if artist != nil
      sorted_songs = artist.songs.sort {|x,y| x.name <=> y.name}
      sorted_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    art = gets.strip
    genre = Genre.find_by_name(art)
    if genre != nil
      sorted_songs = genre.songs.sort {|x,y| x.name <=> y.name}
      sorted_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i
    if (1..Song.all.length).include?(song_num)
      sorted_songs = Song.all.sort {|x,y| x.name <=> y.name}[song_num-1]
      puts "Playing #{sorted_songs.name} by #{sorted_songs.artist.name}"
    end
  end
  
end