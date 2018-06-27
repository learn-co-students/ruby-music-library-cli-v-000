require './config/environment.rb'
require_all './lib'
require 'pry'

class MusicLibraryController
  include Concerns::MLInit
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    input = ""
    until input == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp
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
      end
    end
  end
  
  def list_songs
    song_list = Song.all.sort_by{|song| song.name}
    song_list.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    song_list
  end
  
  def list_artists
    artist_list = Artist.all.sort_by{|artist| artist.name}
    artist_list.each_with_index{|artist, i| puts "#{i + 1}. #{artist.name}"}
  end
  
  def list_genres
    genres_list = Genre.all.sort_by{|genre| genre.name}
    genres_list.each_with_index{|genre, i| puts "#{i + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    artist = Artist.find_by_name(artist)
    unless artist == nil
      song_list = artist.songs.sort_by{|song| song.name}
      song_list.each_with_index{|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"}
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    genre = Genre.find_by_name(genre)
    unless genre == nil
      song_list = genre.songs.sort_by{|song| song.name}
      song_list.each_with_index{|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"}
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    num = gets.chomp.to_i - 1
    song_list = Song.all.sort_by{|song| song.name}
    song = song_list[num]
    puts "Playing #{song.name} by #{song.artist.name}" if song_list.length > num && num >= 0
  end
end