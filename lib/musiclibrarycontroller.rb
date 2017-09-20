class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call

    user_input = ""


    while user_input != "exit"
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
            end
          end
        end


      def list_songs
        Song.all.sort_by {|song| song.name}.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #<- we need to add our index variable into this string somehow...
        end
      end

      def list_artists
        Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
          puts "#{index+1}. #{artist.name}"
        end
      end

      def list_genres
        Genre.all.sort_by {|genre| genre.name}.each_with_index do |genre, index|
          puts "#{index+1}. #{genre.name}"
        end
      end

      def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.strip
        #when user inputs artist, return numbered(alphebatized) list of artist and genre
      if artist = Artist.find_by_name(user_input)
        artist.songs.sort_by {|artist_name| artist_name.name}.each_with_index do |song, index|
          puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end
      else
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      genre.songs.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    else
    end
  end

  def play_song
    #prompts for user input
    #accepts user input (must be an integer)
    #prompts the user to choose a song from the alphabetized list output by #list_songs
    #upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
    #checks that the user entered a number between 1 and the total number of songs in the library
    #does not 'puts' anything out if a matching song is not found
    #checks that the user entered a number between 1 and the total number of songs in the library
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i - 1
    if user_input.between?(0, Song.all.length-1)
      #Song.all.sort_by{|song|song.name}[user_input] <- gets a single song object from the sorted array of Songs
      all_songs = Song.all
      sorted_songs = all_songs.sort_by{|song| song.name}
      the_song = sorted_songs[user_input]
      puts "Playing #{the_song.name} by #{the_song.artist.name}"
    end
  end


end
