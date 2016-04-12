require "pry"

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Please choose an option"
      input = gets.strip
      case input
      when "list songs"
        show_songs
      when "list artists"
        show_artists
      when "list genres"
        show_genres
      when "play song"
        play
      when "list artist"
        show_artist
      when "list genre"
        show_genre
      end
    end

    def show_songs
      index_number = 1
      Song.all.each do |song|
        puts "#{index_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        index_number += 1
      end
    end

    def show_artists
      Artist.all.each do |artist|
        puts "#{artist.name}"
      end
    end

    def show_genres
      Genre.all.each do |genre|
        puts "#{genre.name}"
      end
    end

    def play
      puts "Select a song by choosing a number"
      number = gets.strip.to_i
      puts "Playing #{Song.all[number - 1].artist.name} - #{Song.all[number - 1].name} - #{Song.all[number - 1].genre.name}"
    end

    def show_artist
      puts "What artist's songs would you like to see?"
      artist = gets.strip
      if artist = Artist.find_by_name(artist)
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

    def show_genre
      puts "What genre's songs would you like to see?"
      genre = gets.strip
      if genre = Genre.find_by_name(genre)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end
