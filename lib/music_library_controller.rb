require 'pry'

class MusicLibraryController

  #accepts one argument, the path to the MP3 files to be imported
  #creates a new MusicImporter object, passing in the 'path' value
  #the 'path' argument defaults to './db/mp3s'
  #invokes the #import method on the created MusicImporter object
  def initialize(path= './db/mp3s')
    @path = path
    @library = MusicImporter.new(@path).import
  end

  #welcomes the user
  #asks the user for input
  #loops and asks for user input until they type in exit
  def call
    input = nil
    until input == 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
    end
  end

  #prints all songs in the music library in a numbered list (alphabetized by song name)
  def list_songs
    #@library[counter].split(" - ").sort[1]
    #binding.pry
    #nested_library = @library.collect {|filename| filename.split(" - ")}
    counter = 0
    while counter <= @library.length
      puts "#{counter+1}. " + @library[counter]
      #.split(" - ").sort[1]
      #@library.each {|filename| puts #{counter+1}. #{filename}"}
      counter +=1
    end
  end

  def lists_artists
  end

  def list_genres
  end

  def list_songs_by_artist
    puts "Enter an artist"
    gets.strip
  end

  def list_songs_by_genre
    puts "Enter a genre"
    gets.strip
  end

  def play_song
  end
end
