class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
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
    command = gets
    while command != "exit"
      puts "What would you like to do?"
      command = gets
    end
  end
  def list_songs
    a = Song.all.sort {|a, b| a.name <=> b.name}
    a.uniq
    a_names = a.map {|x| x.name}
    a_artists = a.map {|x| x.artist.name}
    a_genres = a.map {|x| x.genre.name}
    a.each_with_index {|x, i| puts "#{i+1}. #{a_artists[i]} - #{a_names[i]} - #{a_genres[i]}"}
  end
end
