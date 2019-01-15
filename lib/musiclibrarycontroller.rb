require 'pry'

class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'." 
      counter = 0
      loop do
        puts "What would you like to do?"
        counter += 1 
        answer = gets.chomp
        if answer == "exit" || counter == 4 
          break
        end
      end
  end
  
  def list_songs
    # binding.pry
    counter = 1
    Song.all.sort_by(&:name).map { |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter+=1  
    }
  end
  
  def list_artists
    # binding.pry
    counter = 1
    Artist.all.sort_by(&:name).map { |artist|
      puts "#{counter}. #{artist.name}"
      counter+=1  
    }
  end
  
  def list_genres
    # binding.pry
    counter = 1
    Genre.all.sort_by(&:name).map { |genre|
      puts "#{counter}. #{genre.name}"
      counter+=1  
    }
  end
  
end