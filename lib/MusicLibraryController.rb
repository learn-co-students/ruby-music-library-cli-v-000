class MusicLibraryController

    attr_accessor :path

    def initialize(path = "./db/mp3s")
        @path = path
        MusicImporter.new(path).import
    end

    def call
        input = nil
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

            if input == "list songs"
                self.list_songs
            elsif input == "list artists"
                self.list_artists
            elsif input == "list genres"
                self.list_genres
            elsif input == "list artist"
                self.list_songs_by_artist
            elsif input == "list genre"
                self.list_songs_by_genre
            elsif input == "play song"
                self.play_song
            end
        end
    end

    def list_songs
        sorted_songs = Song.all.sort{|a, z| a.name <=> z.name}
        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        sorted_artists = Artist.all.sort{|a, z| a.name <=> z.name}
        sorted_artists.each_with_index do |artist, index|
            puts "#{index + 1}. #{artist.name}"
        end
    end

    def list_genres
        sorted_genres = Genre.all.sort{|a, z| a.name <=> z.name}
        sorted_genres.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        if Artist.find_by_name(input)
            selected_artist = Artist.find_by_name(input)
            sorted_artist_songs = selected_artist.songs.sort{|a, z| a.name <=> z.name}
            sorted_artist_songs.each_with_index do |song, index|
                puts "#{index + 1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        if Genre.find_by_name(input)
            selected_genre = Genre.find_by_name(input)
            sorted_genre_songs = selected_genre.songs.sort{|a, z| a.name <=> z.name}
            sorted_genre_songs.each_with_index do |song, index|
                puts "#{index + 1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        if Song.all.length >= input && input > 0
            song = Song.all.sort{|a, z| a.name <=> z.name}[input - 1]
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end

end
