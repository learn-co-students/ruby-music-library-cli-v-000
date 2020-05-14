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
    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
      elsif input == "list genres"
      list_genres
      elsif input == "list artist"
      list_songs_by_artist
      elsif input == "list genre"
      list_songs_by_genre
      elsif input == "play song"
      play_song
    end
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
        song_input = gets.strip.to_i
        if song_input > 0 && song_input <= Song.all.length
          list_of_songs = Song.all.sort{|a, b| a.name <=> b.name}
          song = list_of_songs[song_input-1]
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
end