class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end 
  
  def call 
    input = ""
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    while input != "exit"
    input = gets.strip
    
    end
  end
  
  def list_songs
    i = 1 
    @@all.each_with_index do |i, song|
      "#{i += 1}. #{song}"
    end
  end
  
  
end