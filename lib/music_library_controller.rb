require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    # puts "Welcome to Emergence"
    input = gets.downcase

    if input == "list songs"
      n=0
      Song.all.each do |song|
        puts "#{n+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

    elsif input == "list artists"
      Artist.all.each do |artist|
        puts "#{artist.name}"
      end

    elsif input == "list genres"
      Genre.all.each do |genre|
        puts "#{genre.name}"
      end

    elsif input == "list an artist's songs"
      artist = gets.downcase
      binding.pry
      Artist.all.each do |artist|
        if artist.name.downcase == artist
          artist.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      end

    elsif input == "exit"
     return
    end
    call
  end
end
