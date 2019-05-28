require_relative './MusicImporter.rb'
require_relative './Song.rb'
require 'pry'

class MusicLibraryController

    attr_accessor :path, :music_importer

    def initialize(path='./db/mp3s')
        @path = path
        @music_importer = MusicImporter.new(path)
        @music_importer.import
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
        input = ""
        while input != "exit" 
            input = gets.strip
            case input
            when "list songs"
                self.list_songs
            when "list artists"
                self.list_artists
            when "list genres"
                self.list_genres
            when "list artist"
                self.list_songs_by_artist
            when "list genre"
                self.list_songs_by_genre
            when "play song"
                self.play_song
            end
        end
    end

    def list_songs
        counter = 1
        array = Song.all.sort do |a,b| a.name <=> b.name end
        array.each do |song|
            puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            counter += 1
        end
        array
    end

    def list_artists
        counter = 1
        array = Artist.all.sort do |a,b| a.name <=> b.name end
        array.each do |artist|
            puts "#{counter}. #{artist.name}"
            counter  += 1
        end
    end

    def list_genres
        counter = 1
        array = Genre.all.sort do |a,b| a.name <=> b.name end
        array.each do |genre|
            puts "#{counter}. #{genre.name}"
            counter  += 1
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.strip
        artist = Artist.find_by_name(artist_name)
        if artist != nil
            counter = 1
            array = artist.songs.sort do |a,b| a.name <=> b.name end
            array.each do |song|
                puts "#{counter}. #{song.name} - #{song.genre.name}"
                counter  += 1
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets.strip
        genre = Genre.find_by_name(genre_name)
        if genre != nil
            counter = 1
            array = genre.songs.sort do |a,b| a.name <=> b.name end
            array.each do |song|
                puts "#{counter}. #{song.artist.name} - #{song.name}"
                counter  += 1
            end
        end
    end

    def play_song
        array = Song.all.sort do |a,b| a.name <=> b.name end
        puts "Which song number would you like to play?"
        user_selection = gets.strip.to_i
        if user_selection >= 1 && user_selection <= array.size
            song = array[user_selection - 1]
            if song != nil
                puts "Playing #{song.name} by #{song.artist.name}"
            end
        end
    end

end

#d = MusicLibraryController.new
#binding.pry