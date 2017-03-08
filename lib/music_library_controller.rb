require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to Emergence"
    input = gets.strip.downcase

    if input == "list songs"
      Song.all.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    # elsif input == "list arist"
    # elsif input == "exit"
    #   call
    end
  end

end
