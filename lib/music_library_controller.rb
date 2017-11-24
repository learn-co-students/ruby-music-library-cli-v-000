require 'pry'

class MusicLibraryController
    
    attr_reader :song

    def initialize(path = "./db/mp3s")
        @path = path
        new_importer = MusicImporter.new(path)
        new_importer.import
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

        until gets == "exit"

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
    end
    
    def list_songs    
        Song.sort_by_name.each_with_index do |song, index| 
            numbered_song = index.to_i+1          
            puts "#{numbered_song}. #{song.artist.name} - #{song.name} - #{song.genre.name}"  
        end
    end
    
    def list_artists    
        Artist.sort_by_name.each_with_index do |artist, index| 
            numbered_artist = index.to_i+1          
            puts "#{numbered_artist}. #{artist.name}"  
        end
    end   

    def list_genres   
        Genre.sort_by_name.each_with_index do |genre, index| 
            numbered_genre = index.to_i+1          
            puts "#{numbered_genre}. #{genre.name}"  
        end
    end
    
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.strip
        user_input_array = []
        user_input_array << user_input
        user_input_array.each_with_index do |song, index| 
        numbered_song = index.to_i+1     
        
        binding.pry
        if user_input == song.artist.name
            puts "#{numbered_song}. #{song.artist.name} - #{genre.name}"  

          
            end 
        end       
    end
end