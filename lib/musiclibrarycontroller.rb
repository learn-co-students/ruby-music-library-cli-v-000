class MusicLibraryController
  attr_accessor :path
  attr_writer :library
  def initialize(path ='./db/mp3s')
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
    input = gets.strip
    unless input == "exit"
      self.call
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        self.list_songs_by_artist
      elsif input == "list genre"
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
    end
  end
  def list_songs
    Song.all.sort_by{|song| song.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each.with_index(1) do |artist, i|
     puts "#{i}. #{artist.name}"
    end
  end
  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    songs_by_artist = Artist.find_or_create_by_name(artist).songs
    songs_by_artist.sort_by{|song| song.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.name} - #{song.genre.name}"
    end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    songs_by_genre = Genre.find_or_create_by_name(genre).songs
    songs_by_genre.sort_by{|song| song.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name}"
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    songs = Song.all
    if input.between?(1,songs.size)
      songs.sort_by{|song| song.name}.each.with_index(1) do |song, i|
        if input == i
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end
  end
end
