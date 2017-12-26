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
        user_input = gets
        while ('exit' != user_input)
            this.send(user_input.gsub(' ', '_'))
            user_input = gets
        end
    end

    def list_songs
        filenames = @music_importer.files
        filenames.map! {|filename| (filename.split('.'))[0] }
        filenames.map! {|filename| filename.split(' - ')}
        filenames.sort_by! {|filename| filename[1]}
        filenames.map! {|filename| filename.join(' - ')}
        filenames.each_with_index {|filename, index| puts "#{index+1}. #{filename}"}
    end

    def list_artists
        artist_names = Artist.all.map! {|artist| artist.name}
        artist_names.sort.each_with_index {|name, index| puts "#{index+1}. #{name}"}
    end

    def list_genres
        genre_names = Genre.all.map! {|genre| genre.name}
        genre_names.sort.each_with_index {|name, index| puts "#{index+1}. #{name}"}
    end
end