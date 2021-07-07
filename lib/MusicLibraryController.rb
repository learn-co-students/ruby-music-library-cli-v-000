class MusicLibraryController
  
  attr_accessor :music_importer, :user_input
  
  def initialize(path = "./db/mp3s")
    @music_importer = MusicImporter.new(path)
    music_importer.import
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
      puts "What would you like to do?"
    
      user_input = gets.strip
      if user_input == "list songs"
        songs.each_with_index do |value, key|
          puts value
        end
      elsif user_input == "list artists"
        artists.each_with_index do |value, key|
          puts value
        end
      elsif user_input == "list genres" 
        genres.each_with_index do |value, key|
          puts value
        end
      elsif user_input = "exit"
        exit
      end
  end
end
