require 'pry'

class MusicLibraryController
  attr_reader :path
  def initialize(path='./db/mp3s')
    @path = path
    mi = MusicImporter.new(path)
    mi.import
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
    response = ""
    while response != "exit"
      puts "What would you like to do?"
      response = gets.strip
        case response
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
    num = 1
    song_array = Song.all.sort_by {|song| song.name}
    song_array.each do |song|
      puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      num +=1
    end
  end

  def list_artists
    num = 1
    artist_array = Artist.all.sort_by {|art| art.name}
    artist_array.each do |art|
      puts "#{num}. #{art.name}"
      num +=1
    end
  end

  def list_genres
    num = 1
    genre_array = Genre.all.sort_by {|gen| gen.name}
    genre_array.each do |gen|
      puts "#{num}. #{gen.name}"
      num +=1
    end
  end

  def list_songs_by_artist
    num = 1
    puts "Please enter the name of an artist:"
    art = gets.strip
    artist = Artist.find_or_create_by_name(art).songs.sort_by {|song| song.name}
    artist.each do |song|
      puts "#{num}. #{song.name} - #{song.genre.name}"
      num +=1
    end
  end

  def list_songs_by_genre
    num = 1
    puts "Please enter the name of a genre:"
    gen = gets.strip
    genre = Genre.find_or_create_by_name(gen).songs.sort_by {|song| song.name}
    genre.each do |song|
      puts "#{num}. #{song.artist.name} - #{song.name}"
      num +=1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if(1..Song.all.length).include?(input)
      song = Song.all.sort_by(&:name)[input-1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
