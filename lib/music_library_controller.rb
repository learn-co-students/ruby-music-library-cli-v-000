class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    music = MusicImporter.new(path)
    music.import
  end

  def call
    input = ""
    while input != 'exit'                           #loops and asks for user input until they type in exit
      puts "Welcome to your music library!"         #welcomes the user
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip                      #asks the user for input

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

    def list_songs  #prints all songs in the music library in a numbered list (alphabetized by song name)
      Song.all.sort{ |a, b| a.name <=> b.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    # def list_songs
    #   Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
    #     puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    #   end
    # end
    # def list_songs
    #   Song.sorted.each_with_index do |song, index|
    #     puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    #   end
    # end
    def list_artists
      Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|  #prints all artists in the music library in a numbered list (alphabetized by artist name)
        puts "#{i}. #{a.name}"
      end
    end
    # def list_artists
    #   Artist.sorted.each_with_index do |artist, index|
    #     puts "#{index+1}. #{artist.name}"
    #   end
    # end
    def list_genres
      Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i| #prints all genres in the music library in a numbered list (alphabetized by genre name)
        puts "#{i}. #{g.name}"
      end
    end
  #   def list_genres
  #     Genre.sorted.each_with_index do |genre, index|
  #       puts "#{index+1}. #{genre.name}"
  #     end
  #   end
    def list_songs_by_artist
      puts "Please enter the name of an artist:"      #prompts the user to enter an artist
      input = gets.strip                              #accepts user input

      if artist = Artist.find_by_name(input)          #does nothing if no matching artist is found
        artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|  #prints all songs by a particular artist in a numbered list (alphabetized by song name)
          puts "#{i}. #{s.name} - #{s.genre.name}"
        end
      end
    end

    # def list_songs_by_artist
    #   puts "Please enter the name of an artist:"
    #   artist_input = gets.strip
    #
    #   artist = Artist.find_by_name(artist_input)                      #artist_input is searched through all instances of artist class
    #     if artist                                                     #if artist variable returns truthy value, iterator is run, nil value skips each iterator.
    #        sorted_songs = artist.songs.sort {|a,b| a.name <=> b.name} #alphabetize songs by artist instance with sort method, stored in variable sorted_songs
    #        sorted_songs.each_with_index do |song, index|              #sorted_songs alphabetized instance songs to be displayed in each_with_index iterator
    #          puts "#{index+1}. #{song.name} - #{song.genre.name}"
    #        end
    #     end
    # end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"        #prompts the user to enter a genre
      input = gets.strip                              #accepts user input

      if genre = Genre.find_by_name(input)            #does nothing if no matching genre is found
        genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|     #prints all songs by a particular artist in a numbered list (alphabetized by song name)
          puts "#{i}. #{s.artist.name} - #{s.name}"
        end
      end
    end

    # def list_songs_by_genre
    #   puts "Please enter the name of a genre:"
    #   genre_input = gets.strip
    #   genre = Genre.find_by_name(genre_input)
    #     if genre
    #       sorted_genres = genre.songs.sort {|a,b| a.name <=> b.name}
    #       sorted_genres.each_with_index do |song, index|
    #         puts "#{index+1}. #{song.artist.name} - #{song.name}"
    #       end
    #     end
    # end

    def play_song                                 #prompts the user to choose a song from the alphabetized list output by #list_songs
      puts "Which song number would you like to play?"

      input = gets.strip.to_i                     #accepts user input
      if (1..Song.all.length).include?(input)     #checks that the user entered a number between 1 and the total number of songs in the library
        song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]   #upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
      end

      puts "Playing #{song.name} by #{song.artist.name}" if song  #does not 'puts' anything out if a matching song is not found
    end

    # def play_song
    #   puts "Which song number would you like to play?"
    #   song_input = gets.strip.to_i                      #song_input stores user request, adjusted for index beginning at 0.
    #   if song_input.between?(1, Song.all.count)         #play_song runs element if song_input is in in range 1 - collection size
    #     #song = Song.sorted[song_input-1]
    #     song = Song.all.sort {|x,y| x.name <=> y.name}[song_input-1]  #alternate solution with sorted module method: song = Song.sorted[song_input-1]
    #     puts "Playing #{song.name} by #{song.artist.name}"
    #   end
    # end

  end    #end closes call method
end      #end closes class
