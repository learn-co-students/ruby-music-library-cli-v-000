require 'pry'

class MusicLibraryController
  attr_accessor :imported_files
  def initialize(path = './db/mp3s')
    files = MusicImporter.new(path)
    files.import
  end

  def call
    input = gets.strip
    while input != 'exit'
      if input == 'list songs'
        list_songs
      elsif input == 'list artists'
        list_artists
      elsif input == 'list genres'
        list_genres
      elsif input == 'play song'
        play_song
      elsif input == 'list artist'
        list_artist
      elsif input == 'list genre'
        list_genre
      end
      input = gets.strip
    end

    def list_songs
      Song.all.each_with_index do |instance, index|
        puts "#{index + 1}. #{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
      end
    end

    def list_artists
      Song.all.each do |instance|
        puts instance.artist.name.to_s
      end
    end

    def list_genres
      Song.all.each do |instance|
        puts instance.genre.name.to_s
      end
    end

    def play_song
      track = gets.strip.to_i
      instance = Song.all[track - 1]
      puts "Playing #{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
    end

    def list_artist
      artist = gets.strip
      Song.all.each do |instance|
        if instance.artist.name == artist
          puts "#{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
        end
      end
    end

    def list_genre
      genre = gets.strip
      Song.all.each do |instance|
        if instance.genre.name == genre
          puts "#{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
        end
      end
    end
  end
  end
