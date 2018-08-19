require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
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
    input = gets.chomp
    if input == "list songs"
      self.list_songs
    elsif
      input == "list artists"
      self.list_artists
    elsif
      input == "list genres"
      self.list_genres
    elsif
      input == "list artist"
      self.list_songs_by_artist
    elsif
      input == "list genre"
      self.list_songs_by_genre
    elsif
      input == "play song"
      self.play_song
    elsif
      input != "exit"
      call
    end
  end

  def list_songs
     songs = Song.all.sort_by{|song| song.name}
     songs.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    artists = Artist.all.sort_by{|artist| artist.name}
    artists.each_with_index{|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    genres = Genre.all.sort_by{|genre| genre.name}
    genres.each_with_index{|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input)
      sorted_songs = Artist.find_by_name(input).songs.sort_by{|song| song.name}
      sorted_songs.each_with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
      sorted_songs = Genre.find_by_name(input).songs.sort_by{|song| song.name}
      sorted_songs.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    songs = Song.all.sort_by{|song| song.name}
    song = songs[input.to_i - 1]
    if input.to_i.between?(1, Song.all.size)
       puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
