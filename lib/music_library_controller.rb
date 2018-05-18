require 'pry'
class MusicLibraryController 

# extend Concerns::Findable
attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
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
 
   #need to alphabetize list of songs. maybe do that first in Song class?
    def list_songs
      s = Song.all.sort{|a,b| a.name <=> b.name}
      # binding.pry
      s.each.with_index do |song,index| 
        # binding.pry
        puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        
    end
   end
  
  
    def list_artists
      Artist.all.each{|artist| puts "#{artist.name}"}
    end
    
    def list_genres
      Genres.all.each{|genre| puts "#{genre.name}"}
    end
    
    def list_songs_by_artist 
      puts "Please enter a name of an artist?"
      input = gets.strip
      artist = Artist.find_by_name(input)
      artist.songs.each do |song|
       puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end 
    
     def list_songs_by_genre 
      puts "Please enter a genre?"
      input = gets.strip
      genre = Genre.find_by_name(input)
      genre.songs.each do |song|
       puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end 
    
    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip_to_i 
      puts "#{list_songs[input -1]}"
      
    end 
 end  
 
  #     an = gets.strip
  #     Song.all.each do |s|
  #       if s.artist.name == an
  #         puts "#{s.artist.name}"
  #       end
  #     end
  # end
# end




