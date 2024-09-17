class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def list_songs
    Song.list_songs
  end

  def list_artists
    Artist.list_artists
  end

  def list_genres
    Genre.list_genres
  end

  def list_songs_by_artist
    puts("Please enter the name of an artist:")
    artist_name = gets
    Artist.find_or_create_by_name(artist_name).list_songs
  end

  def list_songs_by_genre
    puts("Please enter the name of a genre:")
    name = gets
    Genre.find_or_create_by_name(name).list_songs
  end

  def play_song
    Song.sort_songs
    puts("Which song number would you like to play?")
    input = gets.chomp.to_i-1
    if input >= 0 && input < Song.all.length
      song = Song.all[input]
      puts("Playing #{song.name} by #{song.artist.name}")
    end
    binding.pry
  end

  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")
    input = gets
    list_songs if input == "list songs"
    list_artists if input == "list artists"
    list_genres if input == "list genres"
    list_songs_by_artist if input == "list artist"
    list_songs_by_genre if input == "list genre"
    play_song if input == "play song"
    call if input != "exit"

  end

end
