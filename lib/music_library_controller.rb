require 'pry'
class MusicLibraryController
  attr_reader :music_importer, :music_files, :music_library
  
  def initialize(path = "./db/mp3s")
    @music_importer = MusicImporter.new(path)
    @music_files = @music_importer.files
    @music_library = @music_importer.import
  end
  
  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      break if gets.strip == "exit"
    end
  end
  
  def list_songs
    #i = 1 
    #self.music_files.each do |file|
    # puts "#{i}. #{file}"
    # binding.pry
    #end
    self.sort_by_song_name
    binding.pry
  end
  
  def sort_by_song_name
    # I've got the song names sorted. Now, how do I compare them with the file names?
    # Remember: the goal is to return the file names sorted by the song names alphabetically.
    # For some reason, #match? doesn't work on Strings. This must be an earlier Ruby version...
    # Maybe use #split on each file, then match the sorted songs with that new collection.
    # See the process I wrote on notebook paper.
    self.collect_song_names.collect do |song_name| 
      
    end
  end
  
  def collect_song_names
    self.music_library.collect{|song| song.name}.sort
  end 
end