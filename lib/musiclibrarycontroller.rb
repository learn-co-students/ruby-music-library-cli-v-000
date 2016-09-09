require 'pry'

class MusicLibraryController
    
    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import
    end
    
    def list_commands
        puts "list songs === lists all songs by artist name"
        puts "play song ==== plays a song from the above list"
        puts "list artists = lists all artists by name"
        puts "list artist == lists all songs by a particular artist"
        puts "list genres == lists all genres by name"
        puts "list genre === lists all songs within a particular genre"
        puts "exit ========= exits the program"
    end
    
    def songs
        Song.sort_by_artist.each_with_index do |this_song, index|
            puts "#{index + 1}. #{this_song.artist.name} - #{this_song.name} - #{this_song.genre.name}"
        end
    end
    
    def play_song
        puts "Enter song number"
        number = gets.strip.to_i
        index = number - 1
        songs = Song.sort_by_artist
        puts "Playing #{songs[index].artist.name} - #{songs[index].name} - #{songs[index].genre.name}"
    end
    
    def artists
        Artist.sort_by_name.each do |this_artist|
            puts "#{this_artist.name}"
        end
    end
    
    def list_artist_songs
        puts "Please enter artist name"
        artist_name = gets.strip
        if !Artist.find_by_name(artist_name)
            puts "I'm sorry, I can't find that artist"
            list_artist_songs
        else
            artist = Artist.find_by_name(artist_name)
            artist.songs.each do |song|
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
        end
    end
    
    def genres
        Genre.sort_by_name.each do |this_genre|
            puts "#{this_genre.name}"
        end
    end
    
    def list_genre_songs
        puts "Please enter genre name"
        genre_name = gets.strip
        if !Genre.find_by_name(genre_name)
            puts "I'm sorry, I can't find that genre."
            list_genre_songs
        else
            genre = Genre.find_by_name(genre_name)
            genre.songs.each do |song|
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
        end
    end
    
    def call
        puts "What would you like to do?"
        puts "(enter help for help)"
        input = gets.strip
        
        if input == "exit"
            puts "Goodbye"
        elsif input == "help"
            list_commands
            call
        elsif input == "list songs"
            songs
            call
        elsif input == "play song"
            play_song
            call
        elsif input == "list artists"
            artists
            call
        elsif input == "list artist"
            list_artist_songs
            call
        elsif input == "list genres"
            genres
            call
        elsif input == "list genre"
            list_genre_songs
            call
        else 
            puts "I'm sorry, I don't understand that command."
            call
        end
    end
end