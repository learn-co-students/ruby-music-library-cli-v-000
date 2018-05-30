require 'pry'

class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    @input = nil
    new = MusicImporter.new(@path)
    new.import 
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
    while @input != "exit" do
      puts "What would you like to do?"
      @input = gets.strip
      if @input == "list songs"
        self.list_songs 
      elsif @input == "list artists"
        self.list_artists
      elsif @input == "list genres"
        self.list_genres
      elsif @input == "list artist"
        self.list_songs_by_artist
      elsif @input == "list genre"
        self.list_songs_by_genre
      elsif @input == "play song" 
        self.play_song
      end
    end
  end
  
  def list_songs
    alphabetical_songs = Song.all.sort { |x, y| x.name <=> y.name }
    number = 1
    alphabetical_songs.each do |song|
      name = song.name
      artist = song.artist.name
      genre = song.genre.name
      puts "#{number}. #{artist} - #{name} - #{genre}"
      number += 1
    end
  end
  
  def list_artists
    alphabetical_artists = Artist.all.sort { |x, y| x.name <=> y.name }
    number = 1
    alphabetical_artists.each do |artist|
      artist_name = artist.name
      puts "#{number}. #{artist_name}"
      number += 1
    end
  end
  
    def list_genres
    alphabetical_genres = Genre.all.sort { |x, y| x.name <=> y.name }
    number = 1
    alphabetical_genres.each do |genre|
      genre_name = genre.name
      puts "#{number}. #{genre_name}"
      number += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    @input = gets.strip
    if Artist.find_by_name(@input)
      artist = Artist.find_by_name(@input)
      number = 1
      songs = artist.songs.sort { |x, y| x.name <=> y.name }
      songs.each do |song|
       song_name = song.name
       genre_name = song.genre.name
        puts "#{number}. #{song_name} - #{genre_name}"
        number += 1
      end
    else
    end
  end
  
    def list_songs_by_genre
    puts "Please enter the name of a genre:"
    @input = gets.strip
    if Genre.find_by_name(@input)
      genre = Genre.find_by_name(@input)
      number = 1
      songs = genre.songs.sort { |x, y| x.name <=> y.name }
      songs.each do |song|
       song_name = song.name
       artist_name = song.artist.name
        puts "#{number}. #{artist_name} - #{song_name}"
        number += 1
      end
    else
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    @input = gets.strip 
    total = Song.all.count 
    number = @input.to_i
    if number > 0 && number <= total
      alphabetical_songs = Song.all.sort { |x, y| x.name <=> y.name }
      song = alphabetical_songs[number - 1]
      name = song.name
      artist = song.artist.name
      genre = song.genre.name
      puts "Playing #{name} by #{artist}"
    else
    end
  end
  
end