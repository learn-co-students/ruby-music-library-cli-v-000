require 'pry'
require_relative '../concerns/findable.rb'

class MusicLibraryController
  attr_accessor :musiclibrary, :path

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    choice = ""
    puts "Please enter a choice:"

    while choice != "exit"
    choice = gets.to_s.strip.downcase
  
    case choice
        when "list songs"
         list_songs
        when "list artists"
         list_artists
        when "list genres"
         list_genres
        when "play song"
         play_song
        when "list artist"
         list_artist
        when "list genre"
         list_genre
        end
      end
    end

    def list_songs
      Song.all.each_with_index {|song, index| 
        puts "#{index+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
      Artist.all.each {|artist| puts "#{artist.name}"}
    end

    def list_genres
      Genre.all.each {|genre| puts "#{genre.name}"}
    end

    def play_song
      Song.all.each { |song|  
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artist
      puts "Please enter artist's name:"
      choice = gets.strip
      
      Song.all.each do |song| 
        if song.artist.name == choice;
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_genre
      puts "Please enter genre name:"
      choice = gets.strip
      
      Song.all.each do |song| 
        if song.genre.name == choice;
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

end