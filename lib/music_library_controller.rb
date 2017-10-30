class MusicLibraryController

  attr_accessor :artist, :genre

  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
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
    input = gets
    while input != "exit"
      puts "What would you like to do?"
      input = gets
    end
  end

  def list_songs
    counter = 1
    sort = []
    @importer.files.collect do |song|
      info = song.split(" - ")
      genre = info[2].split(".")
      info.pop()
      genre.pop()
      genre_s = genre.join()
      info << genre_s
      sort << info
    end
    sorted = sort.sort_by do |array|
      array[1]
    end
    sorted_final = sorted.collect do |array|
      array.join(" - ")
    end
    sorted_final.each do |song|
      puts "#{counter}. #{song}"
      counter += 1
    end

  end

  def list_artists
    artists = []
    counter = 1
    all_songs = Artist.all
    all_songs.each do |song|
      artists << song.name
    end
    artists_sorted = artists.sort()
    artists_sorted.each do |artist|
      puts "#{counter}. #{artist}"
      counter += 1
    end
  end

  def list_genres
    genres = []
    counter = 1
    all_songs = Genre.all
    all_songs.each do |song|
      genres << song
    end
    genres_sorted = genres.sort()
    genres_sorted.each do |genre|
      puts "#{counter}. #{genre}"
      counter += 1
    end
  end

  def list_songs_by_artist
  end

  def list_songs_by_genre
  end

  def play_song
  end

end
