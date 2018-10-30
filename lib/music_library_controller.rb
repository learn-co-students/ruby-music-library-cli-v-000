
class MusicLibraryController
  attr_accessor :path


  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.strip
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    number = 1
    sorted_songs = Song.all.sort_by {|song|song.name}
    sorted_songs.each do |song|
       puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      number += 1
    end
  end

  def list_artists
    number = 0
    sorted_artists = Artist.all.sort_by{|artist| artist.name}
    sorted_artists.each do |artist|
      number += 1
      puts "#{number}. #{artist.name}"
    end
  end

  def list_genres
    number = 0
    sorted_genres = Genre.all.sort_by{|genre| genre.name}
    sorted_genres.each do |genre|
      number += 1
      puts "#{number}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    number = 1
    artist = Artist.all.find {|artist| artist.name == user_input}
    if artist != nil
      sorted_songs = artist.songs.sort_by{|song|song.name}
      sorted_songs.each do |song|
      puts "#{number}. #{song.name} - #{song.genre.name}"
      number += 1
      end
    else
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    number = 1
    genre_songs = Genre.all.find {|genre| genre.name == user_input}
    if genre_songs != nil
      sorted_songs = genre_songs.songs.sort_by{|song|song.name}
      sorted_songs.each do |song|
      puts "#{number}. #{song.artist.name} - #{song.name}"
      number += 1
      end
    else
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip
    if user_input.to_i > 0 && user_input.to_i <= Song.all.length
      sorted_songs = Song.all.sort_by {|song|song.name}
      user_song = sorted_songs[user_input.to_i - 1]
      puts "Playing #{user_song.name} by #{user_song.artist.name}"
    else
    end
  end
end
