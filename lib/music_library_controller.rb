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
            elsif user_input == "list artists"
                list_artists
            elsif user_input == "list genres"
                list_genres
            elsif user_input == "list artist"
                list_songs_by_artist
            elsif user_input == "list genre"
                list_songs_by_genre
            elsif user_input == "play song"
                play_song
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
        user_input = gets.strip.to_i
        # binding.pry
        Song.all.sort{ |a,b| a.name.downcase <=> b.name.downcase }.each.with_index(1) do |song, index| 
            if user_input == index 
                puts "Playing #{song.name} by #{song.artist.name}" 
                # binding.pry
            end
        end
    end
       
       
        # user puts number
        # number corresponds with song from list of songs
        # from user_input to simple index of list of sorted songs
        # return song
        

        # user_input = gets.strip #to_i makes sure is a number   
        # songs = Song.sort_by_name
        # song = Song.all.sort
        # first_song= Song.all.sort{my params}[4]

        # if list_songs??
    
        #list of songs is not permanently changed ... sounds like it works from the sort as done in list_songs?

       
end