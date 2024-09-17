class MusicLibraryController
    
    def initialize(path = "./db/mp3s")
      @path = path
      MusicImporter.new(path).import
    end

    def call
      input = nil

     until input == "exit"
       input = gets.strip.downcase.chomp
        case input
          when "list songs"
            list_songs
          when "list artists"
            list_artists
          when "list genres"
            list_genres
          when "play song"
            play_song
          when "list artist"
            list_artist
          when "list genre"
            list_genre
          else
            puts "Invalid entry - please try again"
        end
      end
    end

    def list_songs
      Song.all.each do |song|
        puts "#{Song.all.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artists
      Artist.all.each do |artist|
        puts "#{artist.name}"
      end
    end

    def list_genres
      Genre.all.each do |genre|
        puts "#{genre.name}"
      end
    end

    def play_song
      puts "Please select a song:"
      Song.all.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

      song_input = gets.chomp.to_i

      if song_input <= (Song.all.size + 1)
        song = Song.all[song_input - 1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artist
      puts "Please select an artist:"

      artist_input = gets.strip.chomp

      if Artist.find_by_name(artist_input).nil?
        puts "Artist not found, please try again"
      else
        artist = Artist.find_by_name(artist_input)
        artist.songs.each do |song|
          puts "#{artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_genre
      puts "Please select a genre:"

      genre_input = gets.strip.chomp

      if Genre.find_by_name(genre_input).nil?
        puts "Genre not found, please try again"
      else
        genre = Genre.find_by_name(genre_input)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{genre.name}"
        end
      end
    end
end