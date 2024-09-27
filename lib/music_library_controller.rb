require 'pry'

class MusicLibraryController
  attr_accessor :music_importer

  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
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
      input = gets
    end
    return input
  end

  def list_songs
    songs = Song.all.sort_by { |s| s.name }
    i = 0
    while i < songs.length
      puts "#{i+1}. #{songs[i].artist.name} - #{songs[i].name} - #{songs[i].genre.name}"
      i += 1
    end
  end

  def list_artists
    artists = Artist.all.collect {|a| a.name}
    artists.sort!
    i = 0
    while i < artists.length
      puts "#{i+1}. #{artists[i]}"
      i += 1
    end
  end

  def list_genres
    genres = Genre.all.collect {|g| g.name}
    genres.sort!
    i = 0
    while i < genres.length
      puts "#{i+1}. #{genres[i]}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.all.any? { |a| a.name == input }
      artist = Artist.all.select {|a| a.name == input}
      songs = artist[0].songs.sort_by { |song| song.name }
      i = 0
      while i < songs.length
        puts "#{i+1}. #{songs[i].name} - #{songs[i].genre.name}"
        i += 1
      end
    else
      input = gets
    end
    return input
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.all.any? { |g| g.name == input }
      genre = Genre.all.select {|g| g.name == input}
      songs = genre[0].songs.sort_by { |song| song.name }
      i = 0
      while i < songs.length
        puts "#{i+1}. #{songs[i].artist.name} - #{songs[i].name}"
        i += 1
      end
    else
      input = gets
    end
    return input
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets
    if input.to_i >= 1 && input.to_i <= Song.all.length
      i = input.to_i
      songs = Song.all.sort_by { |s| s.name }
      puts "Playing #{songs[i-1].name} by #{songs[i-1].artist.name}"
    else
      input = gets
    end
    return input
  end
end
