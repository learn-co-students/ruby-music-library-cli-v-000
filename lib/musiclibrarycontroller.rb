require 'pry'
require_relative 'musicimporter.rb'

class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def list_song
    counter = 1
    a = []
    Song.all.each do |song|
      a << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    a.sort!
    a.each do |item|
      puts "#{counter}. #{item}"
      counter +=1
    end
  end

  def list_artists
    #binding.pry
    a=[]
    Song.all.each do |song|
      a << song.artist.name
    end
    a.sort!
    a.each do |item|
      puts item
    end
  end

  def list_genres
    a = []
    Song.all.each do |song|
      a << song.genre.name
    end
    a.sort!
    a.each do |item|
      puts item
    end
  end

  def play_song(input)
    a = []

    Song.all.each do |song|
      a << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    a.sort!
    puts "Playing #{a[input-1]}"
  end

  def list_artist(artist)
    a = []
    Song.all.each do |song|
      if song.artist.name == artist
        a << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    puts a
  end

  def list_genre(genre)
    a = []
    Song.all.each do |song|
      if song.genre.name == genre
        a << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    puts a
  end

  def call
    input = gets.chomp
    unless input == "exit"
      case input
        when "list songs" #list songs
        list_song
        when "list artists" #list artist
        list_artists
        when "list genres"
        list_genres
        when "play song" #play a song
        song = gets.chomp.to_i
        play_song(song)
        when "list artist" #list an artist's songs
        artist = gets.chomp
        list_artist(artist)
        when "list genre" #list genre's songs
        genre = gets.chomp
        list_genre(genre)
        else
          puts "Please enter a valid command"
      end
      call
    end
    puts "GoodBye"
  end #end of call
end

