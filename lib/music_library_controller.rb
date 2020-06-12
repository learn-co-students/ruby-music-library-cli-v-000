require "pry"
class MusicLibraryController
  extend Concerns::Findable
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
    
    
    
    if answer == "list songs"
      list_songs 
    end 
      
    if answer == "list artists"
      list_artists
    end
      
    if answer == "list genres"  
      list_genres
    end 
    
    if answer == "list artist"
      list_songs_by_artist
    end
    
    if answer == "list genre"
      list_songs_by_genre
    end 
    
    if answer == "play song"
      play_song
    end 
    
    if answer != "exit" 
      call
    end 
    
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
  
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.strip
    find_artist = Artist.find_by_name(answer)
    if find_artist 
      find_artist.songs.sort{|x, y| x.name <=> y.name}.each.with_index(1) do |value, index| 
        
        puts "#{index}. #{value.name} - #{value.genre.name}"
      end
    end
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets.strip
    find_genre = Genre.find_by_name(answer)
    if find_genre 
      find_genre.songs.sort{|x, y| x.name <=> y.name}.each.with_index(1) do |value, index| 
        puts "#{index}. #{value.artist.name} - #{value.name}"
      end
    end
  end
  
  def play_song 
    puts "Which song number would you like to play?"
    answer = gets.strip.to_i 
    if answer-1 >= 1 && answer-1 <= Song.all.count
      selected_song = Song.all.sort{|x, y| x.name <=> y.name}[answer-1]
    end
    if selected_song
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end
  
  
end 









