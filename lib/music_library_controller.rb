require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_import = MusicImporter.new(path)
    new_import.import
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
    user_input = gets
    if user_input == "list songs"
      self.list_songs
    elsif user_input == "list artists"
      self.list_artists
    elsif user_input == "list genres"
      self.list_genres
    elsif user_input == "list artist"
      self.list_songs_by_artist
    elsif user_input == "list genre"
      self.list_songs_by_genre
    elsif user_input == "play song"
      self.play_song
    else
      user_input = gets until user_input == "exit"
    end
  end

  def alphabetize_songs
    Song.all.sort_by {|song| song.name}
  end

  def list_songs
    counter = 1
    self.alphabetize_songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def alphabetize_artists
    Artist.all.sort_by {|artist| artist.name}
  end

  def list_artists
    counter = 1
    self.alphabetize_artists.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def alphabetize_genres
    Genre.all.sort_by {|genre| genre.name}
  end

  def list_genres
    counter = 1
    self.alphabetize_genres.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    if Artist.find_by_name(artist_name)
      artist = Artist.find_by_name(artist_name)
      counter = 1
      abc_songs = artist.songs.sort_by {|song| song.name}
      abc_songs.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    if Genre.find_by_name(genre_name)
      genre = Genre.find_by_name(genre_name)
      counter = 1
      abc_songs = genre.songs.sort_by {|song| song.name}
      abc_songs.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    chosen_song = gets.to_i
    abc_songs = self.alphabetize_songs
    if chosen_song <= self.alphabetize_songs.length && chosen_song >= 1
      puts "Playing #{abc_songs[chosen_song-1].name} by #{abc_songs[chosen_song-1].artist.name}"
    end
  end

end
