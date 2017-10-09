require 'pry'

class MusicLibraryController
    def initialize(path = './db/mp3s')
        @importer = MusicImporter.new(path)
        @importer.import
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
        
        input = gets
        if input == "list songs"
            list_songs
        elsif input == "play song"
            play_song
        elsif input == "list artist"
            list_songs_by_artist
        elsif input == "list genre"
            list_songs_by_genre
        elsif input == "list artists"
            list_artists
        elsif input == "list genres"
            list_genres
        elsif input != 'exit'
            self.call
        end
    end
    
    def list_songs
        sorted_songs = Song.all.sort {|a,b| a.name <=> b.name}
        sorted_songs.each_with_index do |song, idx|
            puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
    
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets
        artist = Artist.find_by_name(artist_name)
        if artist
            song_list = artist.songs.map {|a| a.name + " - " + a.genre.name}.sort
            output_list(song_list)
        end
    end
    
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets
        genre = Genre.find_by_name(genre_name)
        if genre
            song_list = genre.songs.sort {|a, b| a.name <=> b.name}.map {|d| d.artist.name + " - " + d.name} 
            output_list(song_list)
        end
    end
    
    def play_song
        puts "Which song number would you like to play?"
        input = gets
        if input == input.to_i.to_s #check to see if input is an integer
            sorted_songs = Song.all.sort {|a,b| a.name <=> b.name}
            chosen_song = input.to_i
            if chosen_song > 0 && chosen_song <= sorted_songs.length
                chosen_song -= 1
                puts "Playing #{sorted_songs[chosen_song].name} by #{sorted_songs[chosen_song].artist.name}"
            end
        end
    end
    
    def list_artists
        output_list Artist.all.map {|a| a.name}.sort
    end
    
    def list_genres
        output_list Genre.all.map {|g| g.name}.sort
    end
    
    def output_list(arr)
        arr.each_with_index do |name, idx|
            puts "#{idx + 1}. #{name}"
        end
    end
end
