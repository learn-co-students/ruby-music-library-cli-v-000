require_relative '../config/environment'
require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    x = MusicImporter.new(path)
    x.import
  end

  def call
    x = nil
    
    until x == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      x = gets.strip
      
      if x == "list songs"
      list_songs
      elsif x == "list artists"
        list_artists
      elsif x == "list genres"
        list_genres
      elsif x == "list artist"
        list_songs_by_artist
      elsif x == "list genre"
        list_songs_by_genre
      elsif x == "play song"
        play_song
      end
    end

    #binding.pry

    
  end

  def list_songs
    counter = 1
    x = Song.all.sort_by {|obj| obj.name}
    x.each do |song| 
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter +=1
    end
  end

  def list_artists
    counter = 1
    x = Artist.all.sort_by {|artist| artist.name}
    x.each do |artist| 
      puts "#{counter}. #{artist.name}"
      counter +=1
    end
  end

  def list_genres
    counter = 1
    x = Genre.all.sort_by {|genre| genre.name}
    x.each do |genre| 
      puts "#{counter}. #{genre.name}"
      counter +=1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    x = gets.strip
    if art = Artist.find_by_name(x)
      y = art.songs.sort_by {|song| song.name}
      counter = 1
      y.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter +=1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    x = gets.strip
    if gen = Genre.find_by_name(x)
      y = gen.songs.sort_by {|song| song.name}
      counter = 1
      y.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter +=1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    x = gets.strip.to_i

    if x.between?(1, Song.all.length)
      song = Song.all.sort_by {|song| song.name}[x-1]
    end

    if song
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end