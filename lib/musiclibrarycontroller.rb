class MusicLibraryController
  
  attr_accessor :music 
  
  def initialize(path = "./db/mp3s")
    @music = MusicImporter.new(path)
    @music.import 
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
    input = ""
    while input != "exit"
    puts "What would you like to do?"
    input = gets.strip

      end 
    end
     
      def list_songs
        Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, num| 
         puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end  
      
      def list_artists
          Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |artist, num| 
           puts "#{num}. #{artist.name}"
        end
      end
        
      def list_genres
          Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |genre, num| 
           puts "#{num}. #{genre.name}"
         end
      end
      
      def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_input = gets.chomp
        artist = Artist.find_by_name(artist_input)
          if artist
              artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, num| 
            puts "#{num}. #{song.name} - #{song.genre.name}"
            end
          end
      end
      
      def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_input = gets.chomp
        genre = Genre.find_by_name(genre_input)
          if genre
              genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, num| 
            puts "#{num}. #{song.artist.name} - #{song.name}"
            end 
          end 
        end
      
      def play_song
        puts "Which song number would you like to play?"
        song_input = gets.chomp
        song = Song.find_by_number
        if song
        playing_song = [song_input.to_i - 1]
      end
    end
end