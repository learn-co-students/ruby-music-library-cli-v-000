require_relative "../config/environment.rb"

class MusicLibraryController

  extend Concerns::Findable

  attr_accessor :path, :song, :artist, :genre

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
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

    acceptable_responses = ["list songs", "list artists", "list genres", "list artist", "list genre", "play song", "exit"]

    input = gets.strip
    while !acceptable_responses.include?(input)
      input = gets.strip
    end
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
        elsif input == "exit"
        end
  end

  def list_songs
    counter = 0
    alphabetized = []
    alphabetized = Song.all.sort_by {|obj| obj.name}

    alphabetized.each do |song_instance|
      counter +=1
      puts "#{counter}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
    end
  end

  def list_artists
    counter = 0
    alphabetized = []
    alphabetized = Artist.all.sort_by {|obj| obj.name}
    alphabetized.each do |artist_instance|
      counter +=1
      puts "#{counter}. #{artist_instance.name}"
    end
  end

  def list_genres
    counter = 0
    alphabetized = []
    alphabetized = Genre.all.sort_by {|obj| obj.name}
    alphabetized.each do |genre_instance|
      counter +=1
      puts "#{counter}. #{genre_instance.name}"
    end
  end

  def list_songs_by_artist
    list_of_songs = []
    puts "Please enter the name of an artist:"
    artist_name = gets
    #binding.pry
    if Artist.find_by_name(artist_name)
      list_of_songs = Artist.find_by_name(artist_name).songs
      counter = 0
      alphabetized = []
      alphabetized = list_of_songs.sort_by {|obj| obj.name}
      alphabetized.each do |song_instance|
        counter +=1
        puts "#{counter}. #{song_instance.name} - #{song_instance.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    list_of_songs = []
    puts "Please enter the name of a genre:"
    genre_name = gets

    if Genre.find_by_name(genre_name)
      list_of_songs = Genre.find_by_name(genre_name).songs
      counter = 0
      alphabetized = []
      alphabetized = list_of_songs.sort_by {|obj| obj.name}
      alphabetized.each do |song_instance|
        counter +=1
        puts "#{counter}. #{song_instance.artist.name} - #{song_instance.name}"
      end
    end

  end

  def play_song
    alphabetized = []
    puts "Which song number would you like to play?"

    song_number = gets.strip

   if song_number.to_i.between?(1, Song.all.count)
      alphabetized = Song.all.sort_by {|obj| obj.name}
      artist_name = alphabetized[song_number.to_i-1].artist.name
      song_name = alphabetized[song_number.to_i-1].name
      sentence = "Playing #{song_name} by #{artist_name}"
      puts sentence
    end
  end
end
