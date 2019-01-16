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
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    counter = 1
    Song.all.sort_by(&:name).map {|song|
      if song.artist.name == input
        puts "#{counter}. #{song.name} - #{song.genre.name}" 
        counter+=1
      end
    }
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    counter = 1
    Song.all.sort_by(&:name).map {|song|
      if song.genre.name == input
        puts "#{counter}. #{song.artist.name} - #{song.name}" 
        counter+=1
      end
    }
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    libraryList = []
    Song.all.sort_by(&:name).map { |song|
      libraryList << song  
    }
    
    if input > 0 && input <= libraryList.size
    song = libraryList[input - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
    end      

  end
    
  
end