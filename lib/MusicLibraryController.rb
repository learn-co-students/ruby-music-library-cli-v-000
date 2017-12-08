class MusicLibraryController
  attr_accessor :path, :song, :name

  def initialize(path = "./db/mp3s")
    @path = path
    new = MusicImporter.new(path)
    new.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets until input == "exit"

  end

  #CLI Methods

  def list_songs

  end

  def list_artists

  end

  def list_genres

  end

  def list_songs_by_artist

  end

  def 

end
