require 'pry'

class MusicLibraryController

  attr_accessor :music_importer

  def initialize (path="./db/mp3s")
   MusicImporter.new(path).import
  end

  def call
    command = " "
    puts "Welcome to this Awesome Music Library! Please type in one of the following commands: List Songs, List Artists, List Genres, Play a Song, List Artist's Songs, List Genres' Songs, Exit."

    until command == "exit"
      command = gets.chomp.downcase
      case command

        when "list songs"
          Song.all.each_with_index do |song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        when "list artists"
          Artist.all.each do |artist|
            puts artist.name
          end
        when "list genres"
          Genre.all.each do |genre|
            puts genre.name
          end
        when "play a song"
          puts "Which song do you want to hear?"
          input = gets.chomp.to_i - 1
          puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"          
        end
    end
  end
binding.pry
end