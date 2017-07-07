class MusicLibraryController

  attr_accessor :path, :song, :artist, :genre, :musicimporter

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome To Your Awesome Music Library"
    list_commands
  end

  def user_input
    input = gets.strip
  end

  def print_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_commands
    puts "Please choose from this list of options"
    input = " "
    while input != "exit" do
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

    input = user_input
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        artist_songs
      when "list genre"
        genre_songs
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    Song.all.each do |song|
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artist_songs
    if artist = Artist.find_by_name(user_input)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def genre_songs
    if genre = Genre.find_by_name(user_input)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end
