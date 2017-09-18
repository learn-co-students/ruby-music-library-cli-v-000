class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @list = MusicImporter.new(path).import
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
    input = nil
    until input == "exit"
      input = gets.chomp
    end
  end

  def list_songs
    song = []
    @list.each_with_index do |list, i|
      song[i] = Song.create_from_filename(list)
    end
    song.name.sort!
    #song[0].name = song name song[0].artist.name artist name song[0].genre.song
    binding.pry
  end
end
