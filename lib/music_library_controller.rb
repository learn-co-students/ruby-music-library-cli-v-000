class MusicLibraryController
  attr_reader :path                                     # accepts one argument, the path to the MP3 files to be imported

  def initialize(path = "./db/mp3s")                    # accepts one argument, the path to the MP3 files to be imported / the 'path' argument defaults to './db/mp3s'
    MusicImporter.new(path).import                      # creates a new MusicImporter object, passing in the 'path' value / invokes the #import method on the created MusicImporter object
  end

  def call
    input = ""
    while input != "exit"                               # loops and asks for user input until they type in exit
      puts "Welcome to your music library!"             # welcomes the user
      puts "To list all of your songs, enter 'list songs'."     # asks the user for input, through line 19
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip

      def list_songs                                    # prints all songs in the music library in a numbered list (alphabetized by song name) / is not hard-coded
        Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
      def list_artists                                  # prints all artists in the music library in a numbered list (alphabetized by artist name) / is not hard-coded
        Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |artist, i|
          puts "#{i}. #{artist.name}"
        end
      end
      def list_genres                                   # prints all genres in the music library in a numbered list (alphabetized by genre name) / is not hard-coded
        Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |genre, i|
          puts "#{i}. #{genre.name}"
        end
      end
      def list_songs_by_artist
        puts "Please enter the name of an artist:"      # prompts the user to enter an artist
        input = gets.chomp                              # accepts user input
        if artist = Artist.find_by_name(input)          # does nothing if no matching artist is found
          artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
            puts "#{i}. #{song.name} - #{song.genre.name}"      #  prints all songs by a particular artist in a numbered list (alphabetized by song name)
          end
        end
      end
      def list_songs_by_genre
        puts "Please enter the name of a genre:"        # prompts the user to enter a genre
        input = gets.chomp                              # accepts user input
        if genre = Genre.find_by_name(input)            # does nothing if no matching genre is found
          genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
            puts "#{i}. #{g.artist.name} - #{g.name}"   # prints all songs by a particular genre in a numbered list (alphabetized by song name)
          end
        end
      end
      def play_song
        puts "Which song number would you like to play?"# prompts the user to choose a song from the alphabetized list output by #list_songs
        input = gets.chomp.to_i                         # accepts user input
        if (1..Song.all.length).include?(input)         # does not 'puts' anything out if a matching song is not found / checks that the user entered a number between 1 and the total number of songs in the library
          song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
        end
        puts "Playing #{song.name} by #{song.artist.name}" if song  # upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
      end

      case input                                        # CLI commands / triggers
      when "list songs"                                 # triggers #list_songs
        list_songs
      when "list artists"                               # triggers #list_artists
        list_artists
      when "list genres"                                # triggers #list_genres
        list_genres
      when "list artist"                                # triggers #list_songs_by_artist
        list_songs_by_artist
      when "list genre"                                 # triggers #list_songs_by_genre
        list_songs_by_genre
      when "play song"                                  # triggers #play_song
        play_song
      end
    end
  end
end
