class MusicLibraryController

    def initialize(path = "./db/mp3s")
        @music_importer = MusicImporter.new(path)
        @music_importer.import
    end

    def call
        print_welcome_and_instructions
        handle_user_input
    end

    def print_welcome_and_instructions
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

    def handle_user_input
        user_input = gets.chomp
        while ('exit' != user_input)
            case user_input
            when 'list songs', 'list artists', 'list genres'
                this.send(user_input.gsub(' ', '_'))
            when 'list artist'
                list_songs_by_artist
            end
            user_input = gets.chomp
        end
    end

    def list_songs
        songs = Song.all
        songs.sort_by! {|song| song.name}
        songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
        artist_names = Artist.all.map! {|artist| artist.name}
        artist_names.sort.each_with_index {|name, index| puts "#{index+1}. #{name}"}
    end

    def list_genres
        genre_names = Genre.all.map! {|genre| genre.name}
        genre_names.sort.each_with_index {|name, index| puts "#{index+1}. #{name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.chomp
        artist = Artist.find_by_name(artist_name)
        if (artist)
            songs_by_artist = artist.songs
            songs_by_artist.sort_by! {|song| song.name}
            songs_by_artist.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
        end
    end
  
end