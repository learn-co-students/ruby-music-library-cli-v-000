class MusicLibraryController

    def initialize(path="./db/mp3s")
        @path = path
        new_importer = MusicImporter.new(path)
        new_importer.import
    end

    def call
        input = ""
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
                list_songs
            elsif input == "list artists"
                list_artists
            elsif input == "list genres"
                list_genres
            elsif input == "list artist"
                list_artist
            elsif input == "list genre"
                list_genre
            elsif input == "play song"
                play_song
            end
        end
    end

    def list_songs
        sorted = Song.all.sort_by!{ |song| song.name}
        sorted.each_with_index do |song, i|
            puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        sorted = Artist.all.sort_by!{ |artist| artist.name}
        sorted.each_with_index do |artist, i|
            puts "#{i + 1}. #{artist.name}"
        end
    end

    def list_genres
        sorted = Genre.all.sort_by!{ |genre| genre.name}
        sorted.each_with_index do |genre, i|
            puts "#{i + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        if artist = Artist.find_by_name(input)
            sorted = artist.songs.sort_by!{|song| song.name}
            sorted.each_with_index do |song, i|
                puts "#{i + 1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        if genre = Genre.find_by_name(input)
            sorted = genre.songs.sort_by!{|song| song.name}
            sorted.each_with_index do |song, i|
                puts "#{i + 1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"

        input = gets.strip.to_i
        if input >= 1 && input < Song.all.length
            song = Song.all.sort_by!{ |song| song.name}[input - 1]
        end
        puts "Playing #{song.name} by #{song.artist.name}" if song
    end

    def list_artist
        list_songs_by_artist
    end

    def list_genre
        list_songs_by_genre
    end

end
