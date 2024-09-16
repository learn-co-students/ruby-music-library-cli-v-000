class MusicLibraryController
extend Concerns::Findable
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")

    user_in = ""
    while user_in != "exit"
      user_in = gets
      self.list_songs if user_in.downcase == "list songs"
      self.list_artists if user_in.downcase == "list artists"
      self.list_genres if user_in.downcase == "list genres"
      self.list_songs_by_artist if user_in.downcase == "list artist"
      self.list_songs_by_genre if user_in.downcase == "list genre"
      self.play_song if user_in.downcase == "play song"

    end
  end

  def sort_klass(klass, key)
    klass.all.sort_by {|object| object.send(key)}
  end

  def list_songs
    self.sort_klass(Song, "name").each_with_index do |song, i|
      puts("#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}")
    end
  end

  def list_artists
    self.sort_klass(Artist, "name").each_with_index do |artist, i|
      puts("#{i + 1}. #{artist.name}")
    end
  end

  def list_genres
    self.sort_klass(Genre, "name").each_with_index do |genre, i|
      puts("#{i + 1}. #{genre.name}")
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_or_create_by_name(artist_name)
    song_array = artist.songs.sort_by {|song| song.name}
    song_array.each_with_index do |song, i|
      puts("#{i + 1}. #{song.name} - #{song.genre.name}")
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_or_create_by_name(genre_name)
    genre_array = genre.songs.sort_by {|song| song.name}
    genre_array.each_with_index do |song, i|
      puts("#{i + 1}. #{song.artist.name} - #{song.name}")
    end
  end

  def play_song
    puts("Which song number would you like to play?")
    req = gets
    num = req.to_i - 1
    if num < sort_klass(Song, "name").length && num > 0
      answer = sort_klass(Song, "name")[num]
      puts "Playing #{answer.name} by #{answer.artist.name}"
    end
  end


end
