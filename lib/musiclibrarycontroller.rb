class MusicLibraryController
      def initialize(path = './db/mp3s')
        importer = MusicImporter.new(path)
        importer.import
      end
    
      def list_songs
        sorted = Song.all.sort_by{|i| i.name}
        sorted.each_with_index {|song, i|
          puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        }
      end
    
      def list_artists
        sorted = Artist.all.sort_by{|i| i.name}
        sorted.each_with_index {|artist, i|
          puts "#{i + 1}. #{artist.name}"
        }
      end
    
      def list_genres
        sorted = Genre.all.sort_by{|i| i.name}
        sorted.each_with_index {|genre, i|
          puts "#{i + 1}. #{genre.name}"
        }
      end
      
    
      def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        artist = Artist.find_by_name(input)
        # binding.pry
        if artist
          sorted_songs = artist.songs.sort {|a,b| a.name <=> b.name} # <== nothing in artist.songs
          sorted_songs.each_with_index do |song, i| # <== doesn't run
            puts "#{i + 1}. #{song.name} - #{song.genre.name}"
          end
        end
      end

      def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        genre = Genre.find_by_name(input)
        if genre
          sorted_genres = genre.songs.sort {|a,b| a.name  <=> b.name}
          sorted_genres.each_with_index {|song, i| 
            puts "#{i+1}. #{song.artist.name} - #{song.name}"
          }
        end
      end

      def play_song
        puts "Which song number would you like to play?"
        #input = gets.strip.to_i - 1
        sorted = Song.all.sort_by{|i| i.name}  
        input = Integer(gets) rescue false
        if input && (input > 0 && input <= sorted.length)
          song = sorted[input -1]
          puts "Playing #{song.name} by #{song.artist.name}" 
        end 
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
          input = gets.chomp  #until input == "exit"
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
    end
    