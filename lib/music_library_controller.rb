class MusicLibraryController

  def initialize(path = "./db/mp3s" ) #it "the 'path' argument defaults to './db/mp3s'" do
    MusicImporter.new(path).import #"invokes the #import method on the created MusicImporter object" do
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

      # all of the code below is needed to trigger the methods,
      # otherwise errors will pop up like:
      # MusicLibraryController - CLI Commands 'list songs' triggers #list_songs

      input = gets.strip
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
      sorted_songs = Song.all.sort_by(&:name)
      # either sort_by or a block with <=> can be used to sort an array
      # of objects, such as an array of strings.
      # See http://www.rubyguides.com/2017/07/ruby-sort/

      sorted_songs.each_with_index do |song, index| # not |index,song|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
                                #artist - song title - genre
      end
  end

    def list_artists
        sorted_artists = Artist.all.sort_by(&:name)

        sorted_artists.each_with_index do |artist, index|
          puts "#{index+1}. #{artist.name}"
          # if you only put #{artist}, this error will occur:
          # expected: ("1. Action Bronson")
          #    got: ("1. #<Artist:0x00000003576270>")
        end
    end

    def list_genres
        sorted_genres = Genre.all.sort_by(&:name)

        sorted_genres.each_with_index do |genre, index|
          puts "#{index+1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip

      artist = Artist.find_by_name(input)

      if artist != nil # meaning, there is a matching artist found
         songs_of_artist = artist.songs.sort_by(&:name)

         songs_of_artist.each_with_index do |song, index|
             puts "#{index+1}. #{song.name} - #{song.genre.name}"
         end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip

      genre = Genre.find_by_name(input)

      if genre != nil # meaning, there is a matching genre found
         songs_of_genre = genre.songs.sort_by(&:name)

         songs_of_genre.each_with_index do |song, index|
             puts "#{index+1}. #{song.artist.name} - #{song.name}"
         end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip.to_i # the number that the user inputs will be a string

      # list_songs method inputted below

      sorted_songs = Song.all.sort_by(&:name)
      sorted_songs.each_with_index do |song, index| # not |index,song|
        if input == index + 1
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end



end
