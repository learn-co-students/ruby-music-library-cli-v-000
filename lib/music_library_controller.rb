class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    imported_music = MusicImporter.new(path)
    imported_music.import
  end

  def call(*)
   puts "Welcome to your music library!"
   puts "To list all of your songs, enter 'list songs'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"

    gets "a"
    gets "b"
    gets "c"
    gets "exit"
  end

  def list_songs
    sorted = Song.all.sort_by do |song|
    song.name
    end

    sorted.each.with_index(1) do |song, index|
     puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    sorted
  end

end
