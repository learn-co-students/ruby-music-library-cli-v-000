require "pry"
require_relative "../config/environment.rb"

class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to the Music Library CLI! Please type \"help\" to get started!"
    help = ["list songs - lists all songs", "list artists - lists all artists", "list genres - lists all genres", "play song - plays a song", "list artist - lists all songs by an artist", "list genre - lists all songs in a genre", "help - lists all options", "exit - exits the program"]
    prompt = ">"
    print prompt
    while input = gets.chomp
      case input
      when "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        print prompt
      when "list artists"
        Artist.all.each_with_index do |artist, index|
          puts "#{index + 1}: #{artist.name}"
        end
        print prompt
      when "list genres"
        Genre.all.each_with_index do |genre, index|
          puts "#{index + 1}: #{genre.name}"
        end
        print prompt
      when "play song"
        puts "Please select a song number: "
        i = gets.chomp
        Song.all.each_with_index do |song, index|
          if i.to_i == index + 1
            puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
        print prompt
      when "list artist"
        puts "Please enter an artists name: "
        i = gets.chomp
        Artist.all.each_with_index do |artist, index|
          if i == artist.name
            artist.songs.each do |song|
              puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          end
        end
        print prompt
      when "list genre"
        puts "Please enter a genre: "
        i = gets.chomp
        Genre.all.each_with_index do |genre, index|
          if i == genre.name
            genre.songs.each do |song|
              puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          end
        end
        print prompt
      when "help"
        help.each do |item|
          puts "#{item}"
        end
        print prompt
      when "exit"
        puts "Goodbye!"
        break
      else
        puts "Please enter a valid command. Type \"help\" for a list of available commands."
      end
    end
  end

end
