require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    musim = MusicImporter.new(@path)
    musim.import
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
    while (command = gets.strip.downcase) != "exit"
      case
      when command == "list songs"
        list_songs
      when command == "list artists"
        list_artists
      when command == "list genres"
        list_genres
      when command == "list artist"
        list_songs_by_artist
      when command == "list genre"
        list_songs_by_genre
      when command == "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by!{|s| s.name}.each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by!{|a| a.name}.each_with_index{|a, i| puts "#{i + 1}. #{a.name}"}
  end

  def list_genres
    Genre.all.sort_by!{|g| g.name}.each_with_index{|g, i| puts "#{i + 1}. #{g.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    if artist = Artist.find_by_name(artist)
      artist.songs.sort_by!{|s| s.name}.each_with_index{|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    if genre = Genre.find_by_name(genre)
      genre.songs.sort_by!{|s| s.name}.each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    song = Song.all.sort_by!{|s| s.name}[number - 1] if number > 0 && number < Song.all.length
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
