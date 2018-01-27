require 'pry'

class MusicLibraryController
    
    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
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
        
        user_input = gets
        
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
        
        until user_input == "exit"
            user_input = gets
        end
        
    end
    
    def list_songs
        array = Song.all.sort_by {|x| x.name}
        y = 1
        array.each do |x| 
            puts "#{y}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
            y += 1
        end
    end
    
    def list_artists
        array = Artist.all.collect {|x| x.name}
        y = 1
        array.sort.uniq.each do |x|
            puts "#{y}. #{x}"
            y += 1
        end
    end
    
    def list_genres
        array = Genre.all.collect {|x| x.name}
        y = 1
        array.sort.uniq.each do |x|
            puts "#{y}. #{x}"
            y += 1
        end
    end
    
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets
        artist = Artist.find_by_name(user_input)
        if artist != nil
            artist_songs = artist.songs.sort_by {|x| x.name}
            y = 1
            artist_songs.each do |x|
                puts "#{y}. #{x.name} - #{x.genre.name}"
                y += 1
            end
        end
    end
    
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets
        genre = Genre.find_by_name(user_input)
        if genre != nil
            genre_songs = genre.songs.sort_by {|x| x.name}
            y = 1
            genre_songs.each do |x|
                puts "#{y}. #{x.artist.name} - #{x.name}"
                y += 1
            end
        end
    end
    
    def play_song
        puts "Which song number would you like to play?"
        user_input = gets
        index = user_input.to_i - 1
        array = Song.all.sort_by {|x| x.name}
        if array[index] != nil && index.between?(0, array.count)
            puts "Playing #{array[index].name} by #{array[index].artist.name}"
        end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

end