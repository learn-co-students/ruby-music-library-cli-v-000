class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end
  
  def call
    
    request = ""
    while request != "exit"
      greeting
      request = gets.strip
      case request
        when "list songs"
          puts 'listing songs'
        when "list artists"
          puts 'listing artists'
        when "list genres"
          puts 'listing genres'
        when "list artist"
          puts "listing artist"
        when "list genre"
          puts "listing genre"
        when "play song"
          puts "playing song"
        when "exit"
          break
        else
        end
     end
 end
  
  
  private 
  
  def greeting
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
  
  def list_songs
    
  end
  
  
end