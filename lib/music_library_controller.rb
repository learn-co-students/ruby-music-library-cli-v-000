require 'pry'
class MusicLibraryController
  
  attr_accessor :path, :import
  
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
    # self.new(path)
  end
  
  def MusicImporter.import(path)
    MusicImporter.new(path)
  end
  
  def call
    MusicLibraryController.new(path)
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = nil 
      until input == "exit"
        input = gets.strip 
      end
  end
  
  def list_songs
    array = Song.all.sort_by {|song| song.name}
    array.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    array = Artist.all.sort_by {|artist| artist.name}
    array.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end
  
  def list_genres
    array = Genre.all.sort_by {|genre| genre.name}
    array.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
      input = gets.strip
       if artist = Artist.find_by_name(input)
         #binding.pry
         array = artist.songs.sort_by {|song| song.name}
         array.each_with_index {|song, i|
          puts "#{i+1}. #{song.name} - #{song.genre.name}"
         }
       end
     end
       
  def  list_songs_by_genre
    puts "Please enter the name of a genre:"
      input = gets.strip
       if genre = Genre.find_by_name(input)
         #binding.pry
         array = genre.songs.sort_by {|genre| genre.name}
          
           array.each_with_index do |song, i|
             puts "#{i+1}. #{song.artist.name} - #{song.name}"
          end
       end
     end
     
  def play_song
     puts "Which song number would you like to play?"
     input = gets.strip
     input = input.to_i-1 
     songs = Song.all.sort_by {|s| s.name}
             #sorting songs by s name and we are saving it as a variable
      song = songs[input] 
      if song != nil
        puts "Playing #{song.name} by #{song.artist.name}"
      end
   end
 end
    
    
  
    

  
      
      
        
      
    
     


  


  