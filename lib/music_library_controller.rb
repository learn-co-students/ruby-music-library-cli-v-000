require 'pry'
class MusicLibraryController

  def initialize(file_path = './db/mp3s')
    MusicImporter.new(file_path).import
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

    case input
    when "list songs"
      self.list_songs
    when "list artists"
      self.list_artists
    when "list genres"
      self.list_genres
    when "list artist"
      self.list_songs_by_artist
    when "list genre"
      self.list_songs_by_genre
    when "play song"
      self.play_song
    end

    self.call unless input == 'exit'
  end

  def list_songs
    counter = 1
    sorted_songs = Song.all.sort_by{ |song| song.name}
    sorted_songs.collect do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    sorted_artists = Artist.all.sort_by{ |artist| artist.name}
    sorted_artists.collect do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    sorted_genres = Genre.all.sort_by{ |genre| genre.name}
    sorted_genres.collect do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      counter = 1
      sorted_songs = artist.songs.sort_by{ |song| song.name}
      sorted_songs.collect do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      counter = 1
      sorted_songs = genre.songs.sort_by{ |song| song.name}
      sorted_songs.collect do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1...Song.all.length).include?(input)
      song = Song.all.sort_by{ |song| song.name}[input-1]
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end

end
