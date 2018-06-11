require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'


class MusicLibraryController

  attr_accessor :user_input, :sorted_songs, :sorted_artists, :sorted_genres

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    options = ['list songs',
      'list artists',
      'list genres',
      'list artist',
      'list genre',
      'play song',
      'exit']
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list by artist'."
    puts "To list all of the songs of a particular genre, enter 'list by genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    @user_input = gets.strip
    case
    when options.include?(@user_input)
      self.user_input.gsub(" ","_")
    else
      self.call
    end
  end

  def list_songs
    @sorted_songs = Song.all.sort {|a,b| a.name <=> b.name}

    @sorted_songs.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end

    @sorted_songs
  end

  def list_artists
    @sorted_artists = Artist.all.sort {|a,b| a.name <=> b.name}

    @sorted_artists.each_with_index do |s, i|
      puts "#{i+1}. #{s.name}"
    end

    @sorted_artists
  end

  def list_genres
    @sorted_genres = Genre.all.sort {|a,b| a.name <=> b.name}

    @sorted_genres.each_with_index do |s, i|
      puts "#{i+1}. #{s.name}"
    end

    @sorted_genres
  end

  def list_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    if Artist.names.include?(artist_input)
      # the artist variable holds the Artist object that is referred to by the artist_input string,
      # so the next few steps allow me to access the Artist object's self, its songs, and its song's genres
      artist = Artist.all.detect do |artist|
        artist.name == artist_input
      end
      sorted_songs = artist.songs.sort {|a,b| a.name <=> b.name }
      sorted_songs.each_with_index do |a,i|
        puts "#{i+1}. #{a.name} - #{a.genre.name}"
      end
    end
  end

  def list_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    if Genre.names.include?(genre_input)
      # the genre variable holds the Genre object that is referred to by the artist_input string,
      # so the next few steps allow me to access the Artist object's self, its songs, and its song's genres
      genre = Genre.all.detect do |genre|
        genre.name == genre_input
      end
      sorted_songs = genre.songs.sort {|a,b| a.name <=> b.name }
      sorted_songs.each_with_index do |a,i|
        puts "#{i+1}. #{a.artist.name} - #{a.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip

    if (Integer(user_input) rescue nil) == nil
      # binding.pry
      puts user_input
    else
      # binding.pry
      list_songs
      selected_song = nil
      # binding.pry
      if user_input.to_i.between?(1, @sorted_songs.count)
        @sorted_songs.each_with_index do |song,index|
          if index == (user_input.to_i - 1)
            selected_song = song
          end
        end
        puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
      else
        nil
      end
    end
  end

  def exit

  end

end

# MusicLibraryController.new("./spec/fixtures/mp3s").list_songs
