class MusicLibraryController

    attr_accessor :songs, :list

    #initialize accepts one argument, the path to the MP3 files to be imported
    #initialize creates a new MusicImporter object, passing in the 'path' value
    #initialize the 'path' argument defaults to './db/mp3s'
    #initialize invokes the #import method on the created MusicImporter object

    def initialize (path='./db/mp3s')
      MusicImporter.new(path).import
    end

    # welcomes the user (FAILED - 1)
    # asks the user for input (FAILED - 2)
    # loops and asks for user input until they type in exit (FAILED - 3)

    def call

      input = ""

      while input != 'exit'

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

    # prints all songs in the music library in a numbered list (alphabetized by song name)
    # is not hard-coded

    def list_songs
      Song.all.uniq.sort_by {|song| song.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end


    # prints all artists in the music library in a numbered list (alphabetized by artist name)
    # is not hard-coded

    def list_artists
      Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
      end
    end

    # prints all genres in the music library in a numbered list (alphabetized by genre name)
    # is not hard-coded

    def list_genres
      Genre.all.sort_by {|genre| genre.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
      end
    end

    # prompts the user to enter an artist
    # accepts user input
    # prints all songs by a particular artist in a numbered list (alphabetized by song name)
    # does nothing if no matching artist is found

    def list_songs_by_artist

      puts "Please enter the name of an artist:"
      user_input = gets.chomp

      if Artist.find_by_name(user_input)
        found_artist = Artist.find_by_name(user_input)

        found_artist.songs.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
      end
    end

    # prompts the user to enter a genre
    # accepts user input
    # prints all songs by a particular genre in a numbered list (alphabetized by song name)
    # does nothing if no matching genre is found

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      user_input = gets.chomp

      if Genre.find_by_name(user_input)
        found_genre = Genre.find_by_name(user_input)

        found_genre.songs.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
      end
    end

    # prompts the user to choose a song from the alphabetized list output by #list_songs
    # accepts user input
    # upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
    # does not 'puts' anything out if a matching song is not found
    # checks that the user entered a number between 1 and the total number of songs in the library


    def play_song

      puts "Which song number would you like to play?"
      user_input = gets.chomp.to_i

      if user_input > 0 && user_input <= Song.all.uniq.length
        song_collect = Song.all.uniq.sort_by {|song| song.name}.collect {|song| song}

        puts "Playing #{song_collect[user_input - 1].name} by #{song_collect[user_input - 1].artist.name}"
      end
    end
end
