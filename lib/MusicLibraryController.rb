class MusicLibraryController
require 'pry'
  def initialize(path = "./db/mp3s")
    musicimp = MusicImporter.new(path)
    musicimp.import
  end
  def list_songs
    songs = []
    counter = 1
    Song.all.each do |song|
      songs << song.name
    end
    songs.sort!
    counter = 1
    songs.each do |song|
      match = Song.find_by_name(song)
      puts "#{counter}. #{match.artist.name} - #{match.name} - #{match.genre.name}"
      counter += 1
    end
  end
  def return_songs
    songs = []
    counter = 1
    Song.all.each do |song|
      songs << song.name
    end
    songs.sort!
    return songs
  end
  def list_artists
    artists = []
    counter = 1
    Artist.all.each do |artist|
      artists << artist.name
    end
    artists.sort!
    counter = 1
    artists.each do |artist|
      match = Artist.find_by_name(artist)
      puts "#{counter}. #{match.name}"
      counter += 1
    end
  end
  def list_genres
    genres = []
    counter = 1
    Genre.all.each do |genre|
      genres << genre.name
    end
    genres.sort!
    counter = 1
    genres.each do |genre|
      match = Genre.find_by_name(genre)
      puts "#{counter}. #{match.name}"
      counter += 1
    end
  end
  def list_songs_by_artist
    matches = []
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist == nil
      return
    end
    matches = artist.songs
    song_names = []
    matches.each do |song|
      song_names << song.name
    end
    song_names.sort!
    counter = 1
    song_names.each do |song|
      puts "#{counter}. #{song} - #{Song.find_by_name(song).genre.name}"
      counter += 1
    end
  end
  def list_songs_by_genre
    matches = []
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre == nil
      return
    end
    matches = genre.songs
    song_names = []
    matches.each do |song|
      song_names << song.name
    end
    song_names.sort!
    song_names.uniq!
    counter = 1
    song_names.each do |song|
      puts "#{counter}. #{Song.find_by_name(song).artist.name} - #{song}"
      counter += 1
    end
    return song_names
  end
  def play_song
    song_names = self.return_songs
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > song_names.size || input < 1
      return
    end
    input -= 1
    song = song_names[input]
    selection = Song.find_by_name(song)
    if selection == nil
      return
    end
    puts "Playing #{selection.name} by #{selection.artist.name}"
  end
  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
      input = gets.strip
    end
  end
end
