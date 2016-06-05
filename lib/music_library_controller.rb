class MusicLibraryController
    attr_accessor :path

    def initialize(file_path="./db/mp3s")
        @path = file_path
        music_library = MusicImporter.new(file_path)
        music_library.import
    end

    def call
        user_input = ""
        while user_input != "exit" do
            # puts "Please enter a command: ('bye' to exit)"
            # puts "list songs, list artists, list genres, play songs"
            # puts "list an artist's songs, list a genre's songs"
            # print "Command:"
            user_input = gets.chomp

            case 

            when user_input == "list songs"
                # puts "---[list songs]---"
                Song.all.each.with_index(1) do |song, index| 
                    puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
                end
                # puts "---[end of list]---"
            
            when user_input == "list artists"
                Artist.all.each {|artist| puts artist.name}

            when user_input == "list genres"
                Genre.all.each {|genre| puts genre.name}

            when user_input == "play song"
                song_number = gets.chomp
                MusicLibraryController.find_song_by_number(song_number.to_i)

            when user_input == "list artist"
                artist_name = gets.chomp
                MusicLibraryController.list_songs_by_artist(artist_name)

            when user_input == "list genre"
                genre_name = gets.chomp
                MusicLibraryController.list_songs_by_genre(genre_name)
            
            when user_input == "bye" || user_input == "quit"
                # puts "[Good Bye!]"
                user_input = "exit"
                
            end
        end
    end

    def self.find_song_by_number(song_number)
        song_found = Song.all[song_number.to_i-1]
        puts "Playing #{song_found.artist.name} - #{song_found.name} - #{song_found.genre.name}"
    end

    def self.list_songs_by_artist(artist_name)
        songs_found = Artist.find_by_name(artist_name).songs
        songs_found.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def self.list_songs_by_genre(genre_name)
        songs_found = Genre.find_by_name(genre_name).songs
        songs_found.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

end