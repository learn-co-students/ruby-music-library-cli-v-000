class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path)
    self.music_importer.import
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
    user_input = gets.chomp
    if user_input != "exit"
      self.list_songs if user_input == "list songs"
      self.list_artists if user_input == "list artists"
      self.list_genres if user_input == "list genres"
      self.list_songs_by_artist if user_input == "list artist"
      self.list_songs_by_genre if user_input == "list genre"
      self.play_song if user_input == "play song"
      self.call
    end
  end

  def list_songs
    index = 0
    songs = Song.all.collect { |song| song.name }.sort
    while index < Song.all.length do
      song = Song.find_by_name(songs[index])
      puts (index + 1).to_s + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
      index += 1
    end
  end

  def list_artists
    index = 0
    artists = Artist.all.collect { |artist| artist.name }.sort
    while index < Artist.all.length do
      artist = Artist.find_by_name(artists[index])
      puts (index + 1).to_s + ". " + artist.name
      index += 1
    end
  end

  def list_genres
    index = 0
    genres = Genre.all.collect { |genre| genre.name }.sort
    while index < Genre.all.length do
      genre = Genre.find_by_name(genres[index])
      puts (index + 1).to_s + ". " + genre.name
      index += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets.chomp)
    return nil unless artist
    index = 0
    songs = artist.songs.collect { |song| song.name }.sort
    while index < songs.length do
      song = Song.find_by_name(songs[index])
      puts (index + 1).to_s + ". " + song.name + " - " + song.genre.name
      index += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.chomp)
    return nil unless genre
    index = 0
    songs = genre.songs.collect { |song| song.name }.sort
    while index < songs.length do
      song = Song.find_by_name(songs[index])
      puts (index + 1).to_s + ". " + song.artist.name + " - " + song.name
      index += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_index = gets.chomp.to_i - 1
    if song_index >= 0 && song_index <= Song.all.length
      song = Song.find_by_name(Song.all.collect { |song| song.name }.sort[(song_index)])
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end
end
