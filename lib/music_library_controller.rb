require 'pry'
require_relative 'song.rb'
require_relative 'artist.rb'
require_relative 'genre.rb'

class MusicLibraryController
  attr_accessor :importer

  def initialize(file_path = './db/mp3s')
    @importer = MusicImporter.new(file_path).import
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

    input = gets.chomp


    if input == 'list songs'
      self.list_songs
    elsif input == 'list artists'
      self.list_artists
    elsif input == 'list genres'
      self.list_genres
    elsif input == 'list artist'
      self.list_songs_by_artist
    elsif input == 'list genre'
      self.list_songs_by_genre
    elsif input == 'play song'
      self.play_song
    elsif input == 'exit'
      return "Goodbye!"
    else
      self.call 
    end
  end

  def list_songs
    Song.all.sort{|x, y| x.name <=> y.name}.each_with_index{|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    # file_to_sort = @importer.collect{|file| file.split(" - ")}
    #
    # file_to_join = file_to_sort.sort{|x,y| x[1] <=> y[1]}
    #
    # file_to_puts = file_to_join.collect{|sub_arr| sub_arr.join(" - ").chomp(".mp3")}
    #
    # song_list = file_to_puts.each_with_index{|file, i| puts "#{i + 1}. #{file}"}
    #
    # song_list
  end

  def list_artists
    Artist.all.sort{|x, y| x.name <=> y.name}.each_with_index{|artist, i| puts "#{i + 1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort{|x, y| x.name <=> y.name}.each_with_index{|genre, i| puts "#{i + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    if Artist.find_by_name(artist)
      Artist.find_by_name(artist).songs.sort{|x, y| x.name <=> y.name}.each_with_index{|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"}
    else
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    if Genre.find_by_name(genre)
      Genre.find_by_name(genre).songs.sort{|x, y| x.name <=> y.name}.each_with_index{|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"}
    else
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    song_num = gets.to_i

    if song_num > 0 && song_num < Song.all.sort{|x, y| x.name <=> y.name}.length
      puts "Playing #{Song.all.sort{|x, y| x.name <=> y.name}[song_num - 1].name} by #{Song.all.sort{|x, y| x.name <=> y.name}[song_num - 1].artist.name}"
    else
    end
  end
end
