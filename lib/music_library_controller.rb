class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    self.path = path
    @importer = MusicImporter.new(self.path)
    @importer.import
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

    while input != "exit"
      input = gets.strip
    end
  end

  def list_songs
    list_of_songs = Song.all.sort_by {|song| song.name}
    list_of_songs.each_with_index do |song, index|
    #numbered_list = list_of_songs.collect.each_with_index do |song, index|
      number = index + 1
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    list_of_songs
  end

  def list_artists
    artist_list = Artist.all.sort_by {|artist| artist.name}
    artist_list.each_with_index do |artist, index|
      number = index + 1
      puts "#{number}. #{artist.name}"
    end
  end

  def list_genres
    genres_list = Genre.all.sort_by {|genre| genre.name}
    genres_list.each_with_index do |genre, index|
      number = index + 1
      puts "#{number}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    songs_by_artist = Song.all.select {|song| song.artist.name == input}
    sorted_songs_by_artist = songs_by_artist.sort_by {|song| song.name}
    sorted_songs_by_artist.each_with_index do |song, index|
      number = index + 1
      puts "#{number}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    songs_by_genre = Song.all.select {|song| song.genre.name == input}
    sorted_songs_by_genre = songs_by_genre.sort_by {|song| song.name}
    sorted_songs_by_genre.each_with_index do |song, index|
      number = index + 1
      puts "#{number}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    index = input - 1
    # list_of_songs = self.list_songs
    list_of_songs = Song.all.sort_by {|song| song.name}
    if input > 0 && input < list_of_songs.count
      puts "Playing #{list_of_songs[index].name} by #{list_of_songs[index].artist.name}"
    end
  end

end
