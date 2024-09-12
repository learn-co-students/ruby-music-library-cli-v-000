require 'pry'

class MusicLibraryController

  attr_accessor :path, :artist

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = nil
    until input == "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def songs
    Song.all.each_with_index do |song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index do |artist, index| 
      puts "#{index+1}. #{artist.name}"
    end
  end


  def genres
    Genre.all.each_with_index do |genre, index|
      puts "#{index +1}. #{genre.name}"
    end
  end

  def play_song
    self.songs
    puts "Which number song would you like to play?"
    input = gets.strip.to_i
    Song.all.each_with_index do |song, index|
      if input == (index + 1)
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end


  def list_artist
    input = gets.strip
    artist = Artist.find_by_name(input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    input = gets.strip
    genre = Genre.find_by_name(input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
    
  

=begin (why doesn't this work as well?)
  def list_artist
    self.artists
    puts "Please type an artist's name to list their songs."
    input = gets.strip.downcase
    Artist.all.find do |artist|
      input == artist.name.downcase
        artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
=end     
    


end

