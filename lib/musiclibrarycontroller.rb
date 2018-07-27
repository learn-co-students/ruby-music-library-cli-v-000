class MusicLibraryController 
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import
  end
  
  def call 
    to_do = ""
    until to_do == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'." 
      puts "What would you like to do?" 
      to_do = gets.strip
      
      if to_do == 'play song'
        play_song
      end
    end
  end
  
  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
    end
    
  end
end