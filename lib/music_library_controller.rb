class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music = MusicImporter.new(path)
    music.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your Music Library. Please choose one from the following options:

      - list songs
      - list artists
      - list genres
      - play song
      - list artist
      - list genre"

      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def list_songs
    index_number = 1
    Song.all.each do |song|
      puts "#{index_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      index_number += 1
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    puts "Please choose one song number"
    song_number = gets.strip.to_i - 1
    puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name} "
  end

  def list_artist
    puts "Please provide the artist name to check their songs"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "Please provide a genre to list it's songs"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre.songs.each do |genre|
        puts "#{genre.artist.name} - #{genre.name} - #{genre.genre.name}"
      end
    end
  end
end
