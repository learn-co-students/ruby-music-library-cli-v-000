class MusicLibraryController
    attr_accessor :path
    def initialize(path = "./db/mp3s")
        music_importer = MusicImporter.new(path)
        music_importer.import
    end

    def call
        condition = nil
        while condition != "exit"
            condition = gets.strip
            case condition

            when "list songs"
                list_songs
            when "list artists"
                list_artists
            when "list artist"
                list_artist
            when "list genres"
                list_genres
            when "play song"
                 play_song
            when "list genre"
                list_genre
           
            end
        end
    end

    def play_song
        list_songs
        num = gets.strip
        number = num.to_i
        print "Playing "
        print Song.all[number-1].artist.name + " - "
        print Song.all[number-1].name + " - "
        puts Song.all[number-1].genre.name
    end

    def list_songs
        number = 1
        Song.all.each{ |song|
            print "#{number}. "
            number += 1
            #musician song genre
            print song.artist.name + " - "
            print song.name + " - "
            puts song.genre.name
        }
    end

    def list_artists
        Artist.all.each{ |artist|
            puts artist.name
        }
    end

    def list_artist
        artist_in = gets.strip
        Song.all.each{ |song|
            if  song.artist.name == artist_in
                print song.artist.name + " - "
                print song.name + " - "
                puts song.genre.name
            end
        }
    end

    def list_genres
        Genre.all.each{ |genre|
            puts genre.name
        }
    end

    def list_genre
        genre_in = gets.strip
        Song.all.each{ |song|
            if  song.genre.name == genre_in
                print song.artist.name + " - "
                print song.name + " - "
                puts song.genre.name
            end
        }
    end
end