require 'pry'
require_relative './musicimporter.rb'

class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    response = nil
    until response == "exit"
      puts " "
      puts "Welcome to your library. Please choose an option:" 
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "play song"
      puts "list artist"
      puts "list genre"
      puts "exit"
      puts " "

      response = gets.chomp.downcase
      
      case response
      when "list songs"
        Song.all.each_with_index do |song, index|
          print "#{index+1}. "
          puts song.information
        end
      when "list artists"
        Artist.all.each { |artist| puts artist.name}
      when "list genres"
        Genre.all.each { |genre| puts genre.name} 
      when "play song"
        Song.all.each_with_index do |song, index| 
          print "#{index+1}. " 
          puts song.information
        end
        puts "Please choose a number."
        input = gets.chomp.to_i
        puts "Playing #{Song.all[input-1].artist.name} - #{Song.all[input-1].name} - #{Song.all[input-1].genre.name}" 
      when "list artist"
        Artist.all.each { |artist| puts "#{artist.name}" }
        puts "Please choose an artist."
        input = gets.chomp
        Artist.find_by_name(input).songs.each do |song|
          puts song.information
        end
      when "list genre"
        Genre.all.each { |genre| puts "#{genre.name}" }
        puts "Please choose a genre."
        input = gets.chomp
        Genre.find_by_name(input).songs.each do |song|
          puts song.information
        end
      when "exit"
        puts "You have exited your music library."
      else
        puts "That is an invalid choice."
      end
    end
  end
end