  require 'pry'
class MusicLibraryController
 attr_accessor :path, :files

  def initialize(path ='./db/mp3s')
    @path = path
    musicimporter= MusicImporter.new(path)
    musicimporter.import
   end

   def call
    list = ""
    while list != "exit" #exit is a method in ruby,, use as a string here.
      puts "What would you like to do?"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      input = gets.strip
      if input == "list songs"
         list_songs
       elsif input == "list artists"
          list_artists
        elsif input == "list genres"
           list_genres
         elsif input == "list particular artist"
            list_particular genres
          elsif input == "list particular genre"
             list_particular genre
        end
      end
    end

  end
