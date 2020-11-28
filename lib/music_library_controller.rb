class MusicLibraryController

      def initialize(path = "./db/mp3s")
         MusicImporter.new(path).import
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
         puts "What would you like to do?"

          user_input = gets.strip

          case user_input
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
         when "exit"

          end

          unless user_input == "exit"
             call
         end


      end

      def list_songs
         Song.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
     end

      def list_artists
         Artist.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) {|artist, i| puts "#{i}. #{artist.name}"}
     end

      def list_genres
         Genre.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) {|genre, i| puts "#{i}. #{genre.name}"}
     end

      def list_songs_by_artist
         puts "Please enter the name of an artist:"
         user_input = gets.strip
         if artist = Artist.find_by_name(user_input)
             artist.songs.sort {|a,b| a.name <=> b.name }.each.with_index(1) {|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}
         end
     end

      def list_songs_by_genre
         puts "Please enter the name of a genre:"
         user_input = gets.strip
         if genre = Genre.find_by_name(user_input)
             genre.songs.sort {|a,b| a.name <=> b.name }.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
         end
     end

      def play_song
         puts "Which song number would you like to play?"
         user_input = gets.strip.to_i
         if user_input > 0 && user_input <= Song.all.length
             array = Song.all.sort{|a, b| a.name <=> b.name}
             song = array[user_input-1]
             puts "Playing #{song.name} by #{song.artist.name}"
         end
     end

  end


 
