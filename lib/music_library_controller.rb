require "pry"
class MusicLibraryController
  
  attr_accessor :path, :imported_music
  
  def initialize(path = './db/mp3s')
    @path = path
    new_music = MusicImporter.new(path)
    @imported_music = new_music.import
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
    
    answer = gets.strip 
    
    if answer != "exit" 
      call
    end 
  end


  def list_songs 
    song_objects = []
    @imported_music = imported_music
    imported_music.each do |song|
      song_objects << song.gsub(".mp3", "")
    end
    x = song_objects.sort() 
    puts "1. #{x[0]}"
    puts "2. #{x[1]}"
    puts "3. #{x[2]}"
    puts "4. #{x[3]}"
    #binding.pry  
  end 
  
  
  def list_songs 
    Song.all.sort{|x, y| x.name <=> y.name}.each.with_index(1) do |value, index| 
      puts "#{index}. #{value.artist.name} - #{value.name} - #{value.genre.name}"
    end
  end
  
  
  def list_artists 
    Artist.all.sort{|x, y| x.name <=> y.name}.each.with_index(1) do |value, index| 
      puts "#{index}. #{value.name}"
    end
  end
  
  
  def list_genres 
    Genre.all.sort{|x, y| x.name <=> y.name}.each.with_index(1) do |value, index| 
      puts "#{index}. #{value.name}"
    end
  end
end 