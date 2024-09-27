class MusicLibraryController

    def initialize(path='./db/mp3s')
      @path = path
      music_importer = MusicImporter.new(path)
      music_importer.import
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
      user_input = ""
      until user_input == "exit" do
        puts "What would you like to do?"
        user_input = gets
        case user_input
        when 'list songs'
          list_songs
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'list artist'
          list_songs_by_artist
        when 'list genre'
          list_songs_by_genre
        when 'play song'
          play_song
        end
      end
    end

      def list_songs
        list = Song.all.sort_by { |song| song.name }
        counter = 1
        list.each do |song|
          puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          counter += 1
        end
      end

      def list_artists
        list = Artist.all.sort_by { |artist| artist.name }
        counter = 1
        list.each do |artist|
          puts "#{counter}. #{artist.name}"
          counter += 1
        end
      end

      def list_genres
        list = Genre.all.sort_by { |genre| genre.name }
        counter = 1
        list.each do |genre|
          puts "#{counter}. #{genre.name}"
          counter += 1
        end
      end

      def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.chomp
        if Artist.find_by_name(user_input)
          artist = Artist.find_by_name(user_input)
          list = artist.songs.sort_by { |song| song.name}
          counter = 1
          list.each do |song|
            puts "#{counter}. #{song.name} - #{song.genre.name}"
            counter += 1
          end
        end
      end

      def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.chomp
        if Genre.find_by_name(user_input)
          genre = Genre.find_by_name(user_input)
          list = genre.songs.sort_by { |song| song.name }
          counter = 1
          list.each do |song|
            puts "#{counter}. #{song.artist.name} - #{song.name}"
            counter += 1
          end
        end
      end

      def play_song
        list = Song.all.sort_by { |song| song.name }
        puts "Which song number would you like to play?"
        user_input = gets.chomp.to_i
        index = user_input - 1
        if user_input.between?(1, list.length)
          puts "Playing #{list[index].name} by #{list[index].artist.name}"
        end
      end

end
