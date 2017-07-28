require 'pry'

class MusicLibraryController
  attr_accessor

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
    input = ''
    while input != "exit"
      input = gets.strip
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
    end
  end

  def sorted_songs
    Song.all.sort_by {|song| song.name}
  end

  def sorted_artists
    Artist.all.sort_by {|artist| artist.name}.uniq
  end

  def sorted_genres
    Genre.all.sort_by {|genre| genre.name}.uniq
  end

  def list_songs
    sorted_songs.each_with_index {|song, index| puts "#{index + 1}. " + song.artist.name + " - " + song.name + " - " + song.genre.name}
  end

  def list_artists
    sorted_artists.each_with_index {|artist, index| puts "#{index + 1}. " + artist.name}
  end

  def list_genres
    sorted_genres.each_with_index {|genre, index| puts "#{index + 1}. " + genre.name}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    @names = []
    sorted_songs.find_all {|song| @names << song if input == song.artist.name}
    @names.each_with_index {|song, index| puts "#{index + 1}. " + song.name + " - " + song.genre.name}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    @names = []
    sorted_songs.find_all {|song| @names << song if input == song.genre.name}
    @names.each_with_index {|song, index| puts "#{index + 1}. " + song.artist.name + " - " + song.name}
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if (1..sorted_songs.length).include?(input.to_i)
      index = input.to_i - 1
      user_song = sorted_songs[index]
      puts "Playing #{user_song.name} by #{user_song.artist.name}"
    end
  end

end
