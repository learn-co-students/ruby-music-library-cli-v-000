require 'pry'
class MusicLibraryController
  
  def initialize(path='./db/mp3s')
   importer = MusicImporter.new(path)
   importer.import
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
      input = nil 
      until input == "exit"
        input = gets.strip
        
        case input
          when "list songs"
           list_songs
         when "list artists"
           list_artists
         when "list genres"
           list_genres
         when "list artist"
           list_songs_by_artist
         when "list genre"
           list_songs_by_genre
         when "play song"
           play_song
         end
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
       
  def list_songs_by_genre
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
     new_input = input.to_i-1
     #binding.pry
     if new_input.between?(0,Song.all.length)
       songs = Song.all.sort {|x,y| x.name <=> y.name }
       song = songs[new_input] 
       if song != nil 
         puts "Playing #{song.name} by #{song.artist.name}"
 
       end
     end
   end
 end
    

  