require 'pry'

class MusicLibraryController

  attr_accessor :path, :import

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "type anything"
    input = gets.chomp

    if input == "list songs"
      Song.all.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    if input == "list artists"
      Song.all.each do |song|
        puts "#{song.artist.name}"
      end
    end

    if input == "list genres"
      Song.all.each do |song|
        puts "#{song.genre.name}"
      end
    end

    if input == "play song"
      Song.all.each_with_index do |song, i|
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    if input == "list artist"
      puts "Enter Artist Name"
      artist_name = gets.chomp
      Song.all.each do |song|
        if song.artist.name == artist_name
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

    if input == "list genre"
      puts "Enter Genre Name"
      genre_name = gets.chomp
      Song.all.each do |song|
        if song.genre.name == genre_name
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

    if input == "exit"
      puts "bye"
    else
      call
    end
  end
end
