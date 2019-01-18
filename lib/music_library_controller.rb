class MusicLibraryController 
  
  def initialize(path='./db/mp3s')
    @path = path
    mi = MusicImporter.new(path)
    mi.import
  end
  
  def call
    music_lib_controller = ""
    until music_lib_controller == "exit"
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    music_lib_controller = gets.strip
    end
  end
  
  def list_songs
    # new_mi = MusicImporter.new(path='./db/mp3s')
    Song.all.sort do |a, b|
      a.name <=> b.name
      
    end
  # binding.pry
  end
  
end


 # loop do 
      #   counter += 1
        # puts #{counter}. #{r}"
        # binding.pry

 # counter = 0 
      # loop do
      # counter += 1
      # a.name <=> b.name
      # if a.name < b.name
      #   puts "#{counter}. #{a.name}"
      # elsif a.name > b.name
      #   puts "#{counter}. #{b.name}"
