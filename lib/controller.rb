class MusicLibraryController
  attr_accessor :object

  def initialize(path='./db/mp3s')
    @object = MusicImporter.new(path)
    @object.import
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
    input = gets
    if input != "exit"
      call
    end
  end

  def list_songs
    
  end

  def list_artists

  end

  def list_genres

  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets
  end
end
