class MusicLibraryController
    attr_accessor :path

    def initialize(path = "./db/mp3s")
      @path = path
      music_controller = MusicImporter.new(path)
      music_controller.import
    end

    def call
      input = " "
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

      input = gets.chomp
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

    def list_songs
      songs = Song.all.sort_by{|s| s.name}
      songs.each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
    end

    def list_artists
      artists = Artist.all.sort_by{|a| a.name}
      artists.each_with_index{|a, i| puts "#{i + 1}. #{a.name}"}
    end

    def list_genres
      genres = Genre.all.sort_by{|g| g.name}
      genres.each_with_index{|g, i| puts "#{i + 1}. #{g.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist = gets.chomp
        my_artist = Artist.find_by_name(artist)
      if my_artist != nil
        songs = my_artist.songs.sort_by{|a| a.name}
        songs.each_with_index{|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre = gets.chomp
      my_genre = Genre.find_by_name(genre)
      if my_genre != nil
        songs = my_genre.songs.sort_by{|a| a.name}
        songs.each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      song_number = gets.chomp
      songs = Song.all.sort_by{|s| s.name}

      if song_number.to_i && song_number.to_i > 0 && song_number.to_i < songs.length
          song_name = songs[song_number.to_i - 1].name
          artist_name = songs[song_number.to_i - 1].artist.name
          puts "Playing #{song_name} by #{artist_name}"
      end
    end
end
