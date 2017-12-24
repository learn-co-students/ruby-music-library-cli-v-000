class MusicLibraryController

  attr_accessor :path, :music_library

  def initialize(path = './db/mp3s')
    @path = path
    @music_library = MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"

    input = nil

    until input == "exit"

      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip

      # CLI Commands
      # if input = 'list songs', then call #list_songs
      #input == 'list songs' ? self.list_songs : nil
    end

  end

  # prints all songs in the music library in a numbered list (alphabetized by song name) - is not hard-coded
  def list_songs
    integer = 0
    @song_list = []
    @music_library.each do |song_file|
      @song_list << song_file.split(",")
        #=> ["Zoo Kid - Out Getting Ribs - hip-hop.mp3"]
    end
    @music_library.collect! do |file|
      file.split(" - ")
      #=> ["Zoo Kid", "Out Getting Ribs", "hip-hop.mp3"]
    end
    song_name_list = @music_library.sort_by{|x| x[1]} # can remove the variable assignment and do .collect instead if works 
    #=> Wrong Feels Right -- Jesus Fever -- California -- Perth -- Prizewinning
    song_name_list
    #=> ["1+1", "212", "A.D.H.D", "Abducted", "All the Sun That Shines", "Amor Fati"]
  end

  # prints all artists in the music library in a numbered list (alphabetized by artist name) - is not hard-coded
  def list_artists
  end

  # prints all genres in the music library in a numbered list (alphabetized by genre name) - is not hard-coded
  def list_genres
  end

  # prompts the user to enter an artist
  # accepts user input
  # prints all songs by a particular artist in a numbered list (alphabetized by song name)
  # does nothing if no matching artist is found
  def list_songs_by_artist
  end

  # prompts the user to enter an genre
  # accepts user input
  # prints all songs by a particular genre in a numbered list (alphabetized by song name)
  # does nothing if no matching genre is found
  def list_songs_by_genre
  end

  # prompts the user to choose a song from the alphabetized list output by #list_songs
  # accepts user input
  # upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
  # does not 'puts' anything out if a matching song is not found
  # checks that the user entered a number between 1 and the total number of songs in the library
  def play_song
  end

end
