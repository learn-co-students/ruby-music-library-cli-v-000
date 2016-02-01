require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    controller = MusicImporter.new(path)
    controller.import
  end

  def call
    song_counter = 1
    welcome = 'Hi there'
    answer = gets.chomp

    if answer == 'list songs'
      Song.all.each do |i|
        puts "#{song_counter}. #{i.artist.name} - #{i.name} - #{i.genre.name}"
        song_counter += 1
      end
      answer = gets.chomp
    elsif answer == 'list artists'
      Song.all.each do |i|
        puts "#{song_counter}. #{i.artist.name}"
      end
      answer = gets.chomp
    elsif answer == 'list genres'
      Song.all.each do |i|
        puts "#{song_counter}. #{i.genre.name}"
      end
      answer = gets.chomp
      #regardless of what you type in after play song, this will always print out every artist in the library.
    elsif answer == 'play song'
      answer = gets.chomp
        Song.all.each do |i|
          puts "Playing #{i.artist.name} - #{i.name} - #{i.genre.name}"
        end
      answer = gets.chomp
    elsif answer == 'list artist'
      answer = gets.chomp #gets artist name here
        Song.all.each do |i|
          if i.artist.name == answer
            puts "Playing #{i.artist.name} - #{i.name} - #{i.genre.name}"
          end
        end
      answer = gets.chomp
    elsif answer == 'list genre'
      answer = gets.chomp #gets genre name here
        Song.all.each do |i|
          if i.genre.name == answer
            puts "Playing #{i.artist.name} - #{i.name} - #{i.genre.name}"
          end
        end
      answer = gets.chomp
    else
      puts 'exit'
    end
  end
end
