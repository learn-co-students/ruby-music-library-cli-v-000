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
    puts 'WELCOME TO THE MUSIC LIBRARY'
    answer = gets.chomp

    if answer == 'list songs'
      Song.all.each do |i|
        puts "#{song_counter}. #{i.artist.name} - #{i.name} - #{i.genre.name}"
        song_counter += 1
      end
      call

    elsif answer == 'list artists'
      Song.all.each do |i|
        puts "#{song_counter}. #{i.artist.name}"
        song_counter += 1
      end
      call
    elsif answer == 'list genres'
      Song.all.each do |i|
        puts "#{song_counter}. #{i.genre.name}"
        song_counter += 1
      end
      call

    elsif answer == 'play song'
      puts 'which song?'
      Song.all.each do |i|
        puts "#{song_counter}. #{i.artist.name} - #{i.name} - #{i.genre.name}"
        song_counter += 1
      end
      answer = gets.chomp
        picked_song = Song.all[answer.to_i-1]
        puts "Playing #{picked_song.artist.name} - #{picked_song.name} - #{picked_song.genre.name}"
      call

    elsif answer == 'list artist'
      answer = gets.chomp
        Song.all.each do |i|
          if i.artist.name == answer
            puts "#{i.artist.name} - #{i.name} - #{i.genre.name}"
          end
        end
      call

    elsif answer == 'list genre'
      answer = gets.chomp
        Song.all.each do |i|
          if i.genre.name == answer
            puts "#{i.artist.name} - #{i.name} - #{i.genre.name}"
          end
        end
      call

    else
      puts 'THANK YOU FOR USING THE MUSIC LIBRARY'
    end
  end
end
