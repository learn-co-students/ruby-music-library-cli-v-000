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
    @music_library.collect! do |file|
      file.split(" - ")
      #=> [["Zoo Kid", "Out Getting Ribs", "hip-hop.mp3"]]
    end
    song_name_list = @music_library.sort_by{|x| x[1]}
      #=> [["Beyonce", "1+1", "house.mp3"], ["Azealia Banks", "212", "hip-hop.mp3"]...]
    song_name_list.collect do |file|
      integer += 1
      puts file.join(" - ").gsub(".mp3", "").insert(0, integer.to_s + ". ")
      #=> 1. Beyonce - 1+1 - house
      #   2. Azealia Banks - 212 - hip-hop
      #   3. Kendrick Lamar - A.D.H.D - rap
    end
    #=> => [nil, nil, nil, nil, nil, nil...]
  end

  # prints all artists in the music library in a numbered list (alphabetized by artist name) - is not hard-coded
  def list_artists #the music_library is composed of songs, so if new artist created without a song...needs to be included!

    integer = 1

    Artist.all.sort_by!{|artist| artist.name.downcase}

    Artist.all.collect do |artist|
      puts artist.name.insert(0, integer.to_s + ". ")
      integer += 1
    end

  end

  # prints all genres in the music library in a numbered list (alphabetized by genre name) - is not hard-coded
  def list_genres

    integer = 1

    Genre.all.sort_by!{|genre| genre.name.downcase}

    Genre.all.collect do |genre|
      puts genre.name.insert(0, integer.to_s + ". ")
      integer += 1
    end

  end

  # prompts the user to enter an artist
  # accepts user input
  # prints all songs by a particular artist in a numbered list (alphabetized by song name)
  # does nothing if no matching artist is found
  def list_songs_by_artist

    puts "Please enter the name of an artist:"

    input = gets.strip.to_s

    Artist.all.each do |artist|

      integer = 1

      if artist.name.include?(input)

        @song_list = artist.songs.collect! do |song|
          "#{song.name}" + " - " + "#{song.genre.name}"
        end

        @song_list.sort.collect do |song|
          puts song.insert(0, integer.to_s + ". ")
          integer += 1
        end

      else
        nil
      end

    end

  end

  # prompts the user to enter an genre
  # accepts user input
  # prints all songs by a particular genre in a numbered list (alphabetized by song name)
  # does nothing if no matching genre is found
  def list_songs_by_genre

    puts "Please enter the name of a genre:"

    @song_list = []

    input = gets.strip.to_s

    Genre.all.each do |genre|

      integer = 1

      if genre.name.include?(input)

        genre.songs.collect do |song|
          @song_list << "#{song.artist.name}" + ", " + "#{song.name}"
        end
        # need to combine these two and don't add the hyphen so you don't have to take it away!
        @song_list.collect! do |song|
          song.split(", ")
        end

        @song_list.sort_by!{|song| song[1]}
        #=> [["Cults", "Abducted"], ["Jacques Greene", "Another Girl"], ["Jamie xx", "Far Nearer"]...]

        @song_list.collect! do |song|
          song.join(" - ")
        end
        #return @song_list
        #=> [["Cults - Abducted", "Jacques Greene - Another Girl", "Jamie xx - Far Nearer",...]

        @song_list.collect do |song|
          puts song.insert(0, integer.to_s + ". ")
          integer += 1
        end

      else
        nil
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

    input = gets.strip

    @songs = self.list_songs### need to access songs.all to get artist.name and song.name info?
    if input.to_i < 1 || input > @songs.size
      nil
    else
      @songs.each do |song_string| # maybe temporarily split to access indices?
        if song_string.include?(input)
          puts "Playing '#{song_string.name}' by '#{song.artist.name}'"
    end

  end

end
