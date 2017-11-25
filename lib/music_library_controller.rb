require 'pry'

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        @path = path
        new_importer = MusicImporter.new(path)
        new_importer.import
    end

    def call
        puts_menu     
        user_input = gets.strip
        until user_input == "exit"
            if user_input == "list songs"
                list_songs
            end

            puts_menu
    
            user_input = gets.strip
        end
    end

    def puts_menu
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
        if artist = Artist.find_by_name(user_input)
            artist.songs.sort { |a,b| a.name.downcase <=> b.name.downcase }.each.with_index(1) do |song, index|
                puts "#{index}. #{song.name} - #{song.genre.name}"   
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"

        user_input = gets.strip
        if genre = Genre.find_by_name(user_input)
            genre.songs.sort { |a,b| a.name.downcase <=> b.name.downcase }.each.with_index(1) do |song, index|
                puts "#{index}. #{song.artist.name} - #{song.name}"   
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        
        user_input = gets.strip   
        
        songs = Song.sort_by_name

        
        
    
            
        binding.pry
            # 
            #  puts "Playing #{song.name} by #{song.artist.name}"}
            #  binding.pry
        
        
    end
end