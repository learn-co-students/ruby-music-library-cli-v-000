require 'pry'

class MusicLibraryController

  attr_accessor :name, :artist, :genre, :artist_name, :genre_name

  #accepts one argument, the path to the MP3 files to be imported
  #creates a new MusicImporter object, passing in the 'path' value
  #the 'path' argument defaults to './db/mp3s'
  #invokes the #import method on the created MusicImporter object
  def initialize(path= './db/mp3s')
    @path = path
    @library = MusicImporter.new(@path).import
  end

  #welcomes the user
  #asks the user for input
  #loops and asks for user input until they type in exit
  def call
    input = nil
    until input == 'exit'
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
    end
  end

  #prints all songs in the music library in a numbered list (alphabetized by song name)
  def list_songs
    nested_library = @library.collect {|filename| filename.split(" - ")}
    sorted_nested_library = nested_library.sort {|x,y| x[1] <=> y[1]}

    counter = 0
    sorted_library = []
    while counter < sorted_nested_library.length
      sorted_library << sorted_nested_library[counter].join(" - ")
      counter +=1
    end

    listed_library = []
    sorted_library.each do |filename|
      num = sorted_library.index {|x| x == filename} + 1
      puts "#{num}. #{filename}"
      listed_library << "#{num}. #{filename}"
    end
    listed_library
  end

  def list_artists
    artist_list = []

    Artist.all.collect do |artist|
      artist_list << artist.name
    end
    artist_list.uniq!.sort!

    artist_list.each do |artist_name|
      num = artist_list.index(artist_name) + 1
      puts "#{num}. #{artist_name}"
    end
  end

  def list_genres
    genre_list = []

    Genre.all.collect do |genre|
      genre_list << genre.name
    end
    genre_list.uniq!.sort!

    genre_list.each do |genre_name|
      num = genre_list.index(genre_name) + 1
      puts "#{num}. #{genre_name}"
    end
  end

  #prints all songs by a particular artist in a numbered list (alphabetized by song name)
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip

    song_list = []
    Song.all.collect do |song|
      if song.artist.name == artist_name
        song_list << "#{song.name} - #{song.genre.name}"
      end
    end
    song_list.sort!

    song_list.each do |song|
      num = song_list.index(song) + 1
      puts "#{num}. #{song}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip

    genre_list = []
    Song.all.collect do |song|
      if song.genre.name == genre_name
        genre_list << "#{song.artist.name} - #{song.name}"
      end
    end

    nested_library = genre_list.collect {|filename| filename.split(" - ")}
    sorted_nested_library = nested_library.sort {|x,y| x[1] <=> y[1]}

    counter = 0
    sorted_library = []
    while counter < sorted_nested_library.length
      sorted_library << sorted_nested_library[counter].join(" - ")
      counter +=1
    end

    sorted_library.each do |filename|
      num = sorted_library.index {|x| x == filename} + 1
      puts "#{num}. #{filename}"
    end
  end

  #prompts the user to choose a song from the alphabetized list output by #list_songs
  def play_song
    #list_songs
    puts "Which song number would you like to play?"
    song_number = gets.strip
    binding.pry
    if list_songs.detect {|song| song.start_with?(song_number)}
      puts "Playing #{} by #{}"
    end
  end
end
