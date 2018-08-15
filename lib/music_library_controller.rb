class MusicLibraryController
  attr_accessor :path, :importer, :input

  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(path).import
    @input = ""
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
    until @input == "exit"
      @input = gets.strip
    end
  end

  def sort_all_by_name(o)
    o.all.sort! {|a, b| a.name <=> b.name}
  end

  def list_songs
    Song.sort_all_by_name
    Song.all.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.sort_all_by_name
    Artist.all.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.sort_all_by_name
    Genre.all.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

end
