require 'pry'
class MusicLibraryController
  attr_accessor :path, :library

  def initialize(path = "./db/mp3s") 
    @library = MusicImporter.new(path).import 
  end# of initialize


  def call
    input = nil 
    while input != "exit" 
      puts "Please make a selection" 
      input = gets.chomp

      case input

        when "list songs"
          @library.each_with_index { |mp3, index | 
            puts "#{index+1}. #{mp3}"
          }

        when "list artists"
          @library.each {|file| 
          data = file.split(" -")
          artist = data[0].strip 
          puts artist 
        }

        when "list genres"
          @library.each {|file|
          data = file.split(" -")
          genre = data[2].split(".mp3").join("")
          puts "#{genre.strip}" 
        }

        when "play song" 
          puts "Which track number would you like to play?"
          selection = gets.chomp
          puts "Playing #{@library[selection.to_i - 1 ]}"

        when "list artist"
          puts "Which artist would you like to list the songs of?"
          selection = gets.chomp
          @library.collect {|file| 
            data = file.split(" -")
            artist = data[0].strip
            if artist == selection 
              puts file
            end# of if 
          }

        when "list genre"
          puts "Which genre would you like to explore the songs of?"
          selection = gets.chomp
          genre = Genre.find_by_name(selection)
          genre.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end# of do 
          

      end# of case
    end# of loop 
  end# of call 

end# of class