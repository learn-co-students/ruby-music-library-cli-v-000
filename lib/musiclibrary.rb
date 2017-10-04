class MusicLibraryController
  attr_accessor :songs_sorted
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
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
    while input != "exit"
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
    end
  end

  def list_songs
    songs_sorted = Song.all.sort! {|a, b| a.name <=> b.name}
    songs_sorted.each_with_index do |song, index|
      puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists_sorted = Artist.all.sort {|a, b| a.name <=> b.name}
    artists_sorted.each_with_index do |artist, index|
      puts "#{index +1}. #{artist.name}"
    end
  end

  def list_genres
    genres_sorted = Genre.all.sort {|a, b| a.name <=> b.name}
    genres_sorted.each_with_index do |genre, index|
      puts "#{index +1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist_array = Artist.all.select {|artist| artist.name == artist_name}
    #binding.pry
    artist_found = artist_array[0]
    if artist_found.is_a? Artist
      artist_found.songs.sort! {|a, b| a.name <=> b.name}
      #binding.pry
      artist_found.songs.each_with_index do |song, index|
        puts "#{index +1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre_array = Genre.all.select {|genre| genre.name == genre_name}
    #binding.pry
    genre_found = genre_array[0]
    if genre_found.is_a? Genre
      genre_found.songs.sort! {|a, b| a.name <=> b.name}
      #binding.pry
      genre_found.songs.each_with_index do |song, index|
        puts "#{index +1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip
    song_index = song_number.to_i - 1
    songs_sorted = Song.all.sort! {|a, b| a.name <=> b.name}
    #binding.pry
    if songs_sorted.length > song_number.to_i && song_number.to_i >= 1
      song = songs_sorted[song_index]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
