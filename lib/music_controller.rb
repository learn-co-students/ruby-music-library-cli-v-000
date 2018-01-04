class MusicLibraryController

    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
    end
    
    def call
        input = ""
        puts "Welcome to your music library!" 
        instructions
        while input != "exit"
            input = gets.strip
            case input
            when 'help'
                instructions
            when 'list songs'
                list_songs
            when 'list artists'
                list_artists
            when 'list genres'
                list_genres
            when 'list artist'
                list_songs_by_artist
            when 'list genre'
                list_songs_by_genre
            when 'play song'
                play_song
            else
                puts "What would you like to do?"
            end
        end   
    end
    
    def instructions
        puts "To list all of your songs, enter 'list songs'." 
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
    end
    
    def list_songs
    songs = Song.all.sort_by { |song| song.name }
        songs.each_with_index do |song, i|
            puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
    
    def list_artists
        Artist.numbered_list
    end
    
    def list_genres
        Genre.numbered_list    
    end
    
    def list_songs_by_artist 
        puts "Please enter the name of an artist:"
        input = gets.strip
        songs = Song.all.keep_if { |song| song.artist.name == input }
        sorted_songs = songs.sort_by { |song| song.name }
        sorted_songs.each_with_index do |song, i|
            puts "#{i+1}. #{song.name} - #{song.genre.name}"
        end
    end
    
    def list_songs_by_genre
        puts "Please enter the name of a genre:"  
        input = gets.strip
        songs = Song.all.keep_if { |song| song.genre.name == input }
        sorted_songs = songs.sort_by { |song| song.name }
        sorted_songs.each_with_index do |song, i|
            puts "#{i+1}. #{song.artist.name} - #{song.name}"
        end
    end
    
    def play_song
        puts "Which song number would you like to play?"
        input = gets.to_i
        i = input - 1
        if input >= 1 && input <= Song.all.count && input != nil
            sorted_songs = Song.all.sort_by { |s| s.name }  
                puts "Playing #{sorted_songs[i].name} by #{sorted_songs[i].artist.name}"
        end
    end
    
end