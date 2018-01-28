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
      input = gets.strip
    while input != "exit" do
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
      else input = gets.strip
      end
    end
  end

  def list_songs
    counter = 0
    list_of_songs = []
    alphabetized = []
    alphabetized = Song.all.sort_by {|obj| obj.name}

    alphabetized.each do |song_instance|
      counter +=1
      puts "#{counter}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
      list_of_songs << "#{counter}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
    end
    list_of_songs
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
    puts "Which song number would you like to play?"

    song_number = gets.strip

  if song_number.to_i.between?(1, Song.all.count)

#binding.pry
#Produces an error because the #list_songs puts output preceeds the method return value
    # artist_name = list_songs[song_number-1].split(" - ")[0]
    # song_name = list_songs[song_number-1].split(" - ")[1]
    # sentence = "Playing #{song_name} by #{artist_name}"
#Produce the right values but is not coming through #list_songs and hang...
      artist_name = Song.all[song_number.to_i-1].artist.name
      song_name = Song.all[song_number.to_i-1].name
      sentence = "Playing #{song_name} by #{artist_name}"

    end
     puts sentence
  end

end
