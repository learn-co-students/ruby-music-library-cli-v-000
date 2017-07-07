class MusicLibraryController
  attr_reader :path, :importer

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path).import
  end

  def call
    input = ""
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    while input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      input = gets.strip
      case input
        when "list song"
          importer.list_songs
        when "list artists"
          importer.artists
        when "list genres"
          importer.genres
        when "list artist"
          importer.artist
        when "list genre"
          importer.genre
      end
    end

    def list_songs
      importer.files.each {|song| puts song.name}
    end
  end

end
