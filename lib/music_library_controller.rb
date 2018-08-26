require 'pry'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    @files_array = MusicImporter.new(path).import
  end
  
  def call
    call_input = ""
    until call_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."     
      puts "What would you like to do?"
      call_input = gets.chomp
      case call_input 
      when "list songs"
        list_songs
      when "list artists"
        list_artists    
      when "list genres"
        genres
      when "list artist"
        artist
      when "list genre"
        genre
      when "play song"
        play_song
      end
    end
  end
  
  def split_files_array
    @files_array.map {|file_string| file_string.split(Regexp.union([' - ', '.mp3']))}
    binding.pry
  end
  
  def list_songs
  end
  
end