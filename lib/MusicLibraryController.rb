require 'pry'
class MusicLibraryController
    attr_accessor :path 

    def initialize(path='./db/mp3s')
        @path = path
        MusicImporter.new(path).import
    end

    def call 
        input = ''
        puts "Welcome to your music library!"
        puts "What would you like to do?"
        how_to
        until input == 'exit'
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

    def how_to
        puts "To list all of your songs, enter 'list songs'." 
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
    end
    
    def list_songs
        Song.all.sort{|a, b| a.name <=> b.name}.each_with_index.collect do |song, index|
            puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index.collect do |artist, index|
            puts "#{index +1}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index.collect do |genre, index|
            puts "#{index +1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        artist = Artist.find_by_name(input)
            if artist != nil then
                list = artist.songs.sort{|a, b| a.name <=> b.name}
                list.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
            end
    end

    def list_songs_by_genre
        puts ("Please enter the name of a genre:")
        input = gets.strip
        genre = Genre.find_by_name(input)
            if genre != nil then 
                list = genre.songs.sort{|a, b| a.name <=> b.name}
                list.each_with_index.collect {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
            end
    end

    def play_song
        puts ("Which song number would you like to play?")
        input = gets.to_i
        if input > 0 && input <= Song.all.count then
            sort = Song.all.sort{|a, b| a.name <=> b.name}
            sort.each_with_index {|song, index| puts "Playing #{song.name} by #{song.artist.name}"}
        end
    end 
end