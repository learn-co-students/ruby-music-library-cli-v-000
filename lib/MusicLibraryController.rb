require 'pry'

class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import 
    
  end 
  
  def call 
     user_input = ""
     while user_input != "exit"
       
        puts "Welcome to your music library!"
        
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts"To quit, type 'exit'."
        
        puts "What would you like to do?"
        
        
        user_input = gets.strip
        case user_input 
        
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
    all_songs = Song.all.sort_by{|song| song.name}
    
    all_songs.each_with_index {|song, index| 
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end 
  
  def list_artists
    all_artists = Artist.all.sort_by{|artist| artist.name}
    all_artists.each_with_index { |artist, index|
      puts "#{index+1}. #{artist.name}"
    }
  end 
  
  def list_genres 
    all_genres = Genre.all.sort_by{|genre| genre.name}
    all_genres.each_with_index {|genre, index|
       puts "#{index+1}. #{genre.name}"
    }
  end 
  
  def list_songs_by_artist 
      puts "Please enter the name of an artist:"
      artist_name = gets.strip
          
      found_artist = Artist.find_by_name(artist_name)
      
      if found_artist != nil
         all_songs_by_artist = found_artist.songs.sort_by{|song| song.name}
         all_songs_by_artist.each_with_index do |song, index|
             puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end 
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
      genre_name = gets.strip
          
      found_genre = Genre.find_by_name(genre_name)
      
      if found_genre != nil
         all_songs_by_genre = found_genre.songs.sort_by{|song| song.name}
         all_songs_by_genre.each_with_index do |song, index|
             puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end 
  
  def play_song 
    puts "Which song number would you like to play?"
      song_no = gets.strip
     
    
  end 
  
 
end 