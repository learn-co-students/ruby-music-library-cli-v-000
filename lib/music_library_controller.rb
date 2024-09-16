class MusicLibraryController
  path = ""
  def initialize(path = "./db/mp3s") #"./spec/fixtures/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input= ""
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
    Song.list_song_names
  end

  def list_artists
    Artist.list_artist_names
  end

  def list_genres
    Genre.list_genre_names
  end

  def list_songs_by_artist
    input= ""
    puts "Please enter the name of an artist:"
    input = gets.strip
    Song.list_by_artist(input)
  end

  def list_songs_by_genre
    input= ""
    puts "Please enter the name of a genre:"
    input = gets.strip
    Song.list_by_genre(input)
  end

  def play_song
    #self.list_songs
    puts "Which song number would you like to play?"
    input= ""
    input = gets.strip.to_i
    Song.select_by_number(input)
  end


end
