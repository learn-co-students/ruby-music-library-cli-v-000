require "pry"
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'

class MusicLibraryController

  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable::ClassMethods
  include Concerns::Findable::InstanceMethods

  attr_accessor :path, :importer

  def initialize(path='./db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    @test = importer.import
    @music_list = Song.all
  end

  def call

    user_input = ""

    while user_input.downcase != "exit"
      puts "Welcome to your music library!"
      puts ("To list all of your songs, enter 'list songs'.")
      puts ("To list all of the artists in your library, enter 'list artists'.")
      puts ("To list all of the genres in your library, enter 'list genres'.")
      puts ("To list all of the songs by a particular artist, enter 'list artist'.")
      puts ("To list all of the songs of a particular genre, enter 'list genre'.")
      puts ("To play a song, enter 'play song'.")
      puts ("To quit, type 'exit'.")
      puts ("What would you like to do?")

      user_input = gets.chomp.downcase
      case user_input
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
    @printed = []
    @master_sorted_list = []
    count = 0

    @master_sorted_list = @music_list.sort_by {|song| song.name}
    @master_sorted_list.each do |song|
      if !@printed.include?(song.name)
        count +=1
        list = "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        @printed << song.name
        puts list
      end
    end
  end

  def list_songs_by_artist
    @artist_songs = []
    @sorted_list = []
    count = 0

    puts "Please enter the name of an artist:"
    artist = gets.chomp

    Song.all.each do |song|
      if song.artist.name == artist
        if !@artist_songs.include?(song.name)
          @artist_songs << song
        end
      end
    end

    @sorted_list = @artist_songs.sort_by {|song| song.name}
    @sorted_list.each do |song|
      count +=1
      list = "#{count}. #{song.name} - #{song.genre.name}"
      puts list
    end

  end

  def list_artists
    @printed = []
    @sorted_list = []
    count = 0

    @sorted_list = Artist.all.sort_by {|artist| artist.name}
    @sorted_list.each do |artist|
      if !@printed.include?(artist.name)
        count +=1
        list = "#{count}. #{artist.name}"
        @printed << artist.name
        puts list
      end
    end

  end

  def list_songs_by_genre
    genre_songs = []
    @sorted_list = []
    count = 0

    puts "Please enter the name of a genre:"
    genre = gets.chomp

    Song.all.each do |song|
      if song.genre.name == genre
        if !genre_songs.include?(song.name)
          genre_songs << song
        end
      end
    end

    @sorted_list = genre_songs.sort_by {|song| song.name}
    @sorted_list.each do |song|
      count +=1
      list = "#{count}. #{song.artist.name} - #{song.name}"
      puts list
    end

  end

  def list_genres
    @printed = []
    @sorted_list = []
    count = 0

    @sorted_list = @music_list.sort_by {|song| song.genre.name}
    @sorted_list.each do |song|
      if !@printed.include?(song.genre.name)
        count +=1
        list = "#{count}. #{song.genre.name}"
        @printed << song.genre.name
        puts list
      end
    end
  end

  def play_song
    @master_sorted_list = @music_list.sort_by {|song| song.name}

    puts "Which song number would you like to play?"
    num = gets.chomp

    index = num.to_i - 1

    if index >= 0 && index < @master_sorted_list.size
      puts "Playing #{@master_sorted_list[index].name} by #{@master_sorted_list[index].artist.name}"
    end
  end

end
