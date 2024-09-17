class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path+'/*.mp3'].collect { |path| path.split('/').last }
  end

  def import
    self.files.each {|song| Song.create_from_filename(song)}
  end

end

class MusicLibraryController

  def initialize(path = './db/mp3s')

    importer = MusicImporter.new(path)
    importer.import

  end

  def call

    puts "Welcome to your music library!"

    while(true)

      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      text = gets.chomp()

      self.play_song if text == "play song"
      self.list_songs_by_genre if text == "list genre"
      self.list_songs_by_artist if text == "list artist"
      self.list_genres if text == "list genres"
      self.list_artists if text == "list artists"
      self.list_songs if text == "list songs"
      break if text == "exit"
    end

  end

  def list_songs
    Song.all.each_with_index {|s, k| puts "#{k+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def list_artists
    Artist.all.each_with_index {|s, k| puts "#{k+1}. #{s.name}" }
  end

  def list_genres
    list = Genre.all.sort_by {|o| o.name}
    list.each_with_index {|s, k| puts "#{k+1}. #{s.name}" }
  end

  def list_songs_by_artist

    puts "Please enter the name of an artist:"
    name = gets.chomp()
    songs = Song.all.select {|s| s.artist.name == name}
    songs = songs.sort_by {|s| s.name}
    songs.each_with_index {|s, k| puts "#{k+1}. #{s.name} - #{s.genre.name}" }

  end

  def list_songs_by_genre

    puts "Please enter the name of a genre:"
    name = gets.chomp()
    songs = Song.all.select {|s| s.genre.name == name}
    songs = songs.sort_by {|s| s.name}
    songs.each_with_index {|s, k| puts "#{k+1}. #{s.artist.name} - #{s.name}" }

  end

  def play_song

    puts "Which song number would you like to play?"
    number = gets.chomp.to_i
    list = Song.all.sort_by {|s| s.name}
    puts "Playing #{list[number - 1].name} by #{list[number - 1].artist.name}" if number > 0 and number <= list.count

  end

end
