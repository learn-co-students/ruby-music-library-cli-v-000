require 'pry'
class MusicLibraryController
  attr_reader :path, :music

  def initialize(path = './db/mp3s')
    @path = path
    files = MusicImporter.new(path)
    @music = files.import
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

    while true
      input = gets.strip
      break if input == "exit"
      case input
        when "list songs" then list_songs
        when "list artists" then list_artists
        when "list genres" then list_genres
        when "list artist" then list_songs_by_artist
        when "list genre" then list_songs_by_genre
        when "play song" then play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by{|song| song.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    if Artist.find_by_name(artist)
      Artist.find_by_name(artist).songs.sort_by{|song| song.name}.each_with_index do |artist, index|
        puts "#{index + 1}. #{artist.name} - #{artist.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    if Genre.find_by_name(genre)
      Genre.all.select{|g| g if g.name == genre}[0].songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i # until song_number.to_i.is_a?(Fixnum) &&
    if song_number
      if song_number <= Song.all.length && song_number >= 1
        song = Song.all.sort_by{|song| song.name}[song_number - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
