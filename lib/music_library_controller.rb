require 'pry'

class MusicLibraryController
  def initialize(file_path = './db/mp3s')
    @file_path = file_path
    @importer = MusicImporter.new(@file_path)
    @importer.import
  end

  def call
    # Welcomes the user

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    # Asks the user for input

    response = gets.strip

    # Loops and asks for user input until they type in exit

    until response == "exit"
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
      
      puts "What would you like to do?"
      response = gets.strip
    end
  end

  # CLI Methods

  def list_of_songs
    @all_songs = Song.all

    @all_songs_info = []
    @all_song_names = []

    @all_songs.each do |song|
      song_info = []
      song_info << song.artist.name
      song_info << song.name
      song_info << song.genre.name
      @all_songs_info << song_info
      @all_song_names << song.name
    end

    @all_song_names.sort!
    number = 1
    @numbered_song_titles = []

    @all_song_names.each do |song_name|
      @all_songs_info.each do |song_info|
        if song_info[1] == song_name
          numbered_song_title = "#{number}. #{song_info[0]} - #{song_info[1]} - #{song_info[2]}"
          @numbered_song_titles << numbered_song_title
          number += 1
        end
      end
    end
    @numbered_song_titles
  end

  def list_songs
    self.list_of_songs.each do |song|
      puts song
    end
  end

  def list_artists
    all_artists = Artist.all
    all_artist_names = []
    counter = 1

    all_artists.each do |artist|
      all_artist_names << artist.name
    end

    all_artist_names.sort!

    all_artist_names.each do |name|
      puts "#{counter}. #{name}"
      counter += 1
    end
  end

  def list_genres
    all_genres = Genre.all
    all_genre_names = []
    counter = 1

    all_genres.each do |genre|
      all_genre_names << genre.name
    end

    all_genre_names.sort!

    all_genre_names.each do |name|
      puts "#{counter}. #{name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip

    artist = Artist.find_by_name(artist_name)
    if artist != nil
      all_songs = artist.songs
      song_names = []
      counter = 1

      all_songs.each do |song|
        song_name = "#{song.name} - #{song.genre.name}"
        song_names << song_name
      end

      song_names.sort!

      song_names.each do |name|
        puts "#{counter}. #{name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip

    genre = Genre.find_by_name(genre_name)
    if genre != nil
      all_genre_songs = genre.songs
      alphabetized_song_names = []
      counter = 1

      all_genre_songs.each do |song|
        alphabetized_song_names << song.name
      end

      alphabetized_song_names.sort!

      alphabetized_song_names.each do |name|
        all_genre_songs.each do |song|
          if song.name == name
            song_name = "#{song.artist.name} - #{song.name}"
            puts "#{counter}. #{song_name}"
            counter += 1
          end
        end
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip

    self.list_of_songs.each do |song|
      number_of_song = song.split(". ")[0]
      title_of_song = song.split(". ")[1]
      artist_name = title_of_song.split(" - ")[0]
      song_name = title_of_song.split(" - ")[1]
      if number_of_song == song_number
        puts "Playing #{song_name} by #{artist_name}"
      end
    end
  end
end
