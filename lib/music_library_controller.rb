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
    i = 0
    sorted_files = self.sort_by_song_name
    while i < sorted_files.size
      puts "#{i + 1}. #{sorted_files[i]}"
      i += 1
    end
    binding.pry
    # I've almost got this. I still need to delete ".mp3" off each genre.
  end
  
  def sort_by_song_name
    # Try to refactor this...
    split_files = self.music_files.collect {|file| file.split(' - ')}
    
    new_collection = self.collect_song_names.collect do |song_name| 
      split_files.detect{|file| file.include?(song_name)}
    end
    
   new_collection.collect {|e| e.join(" - ")}
  end
  
  def collect_song_names
    self.music_library.collect{|song| song.name}.sort
  end 
end