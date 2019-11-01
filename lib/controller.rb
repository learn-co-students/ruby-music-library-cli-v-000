require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    input = ""
    while input != "exit"
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
      case input
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
    sorted_array = @importer.files.sort do |a, b|
      if a.split(" - ")[1] == b.split(" - ")[1]
        0
      elsif a.split(" - ")[1] < b.split(" - ")[1]
        -1
      elsif a.split(" - ")[1] > b.split(" - ")[1]
        1
      end
    end

    array_with_numbers = []
    counter = 1
    sorted_array.each do |filename|
      filename_without_ending = filename[/[^.]+/]
      puts "#{counter}. #{filename_without_ending}"
      array_with_numbers << "#{counter}. #{filename_without_ending}"
      counter += 1

    end
    array_with_numbers
  end

  def list_artists
    sorted_artist_array = Artist.all.collect { |artist| artist.name }.sort.uniq

    counter = 1
    sorted_artist_array.each do |artist_name|
        puts "#{counter}. #{artist_name}"
        counter += 1
    end

  end

  def list_genres
    sorted_genres_array = Genre.all.collect { |genre| genre.name }.sort.uniq

    counter = 1
    sorted_genres_array.each do |genre_name|
        puts "#{counter}. #{genre_name}"
        counter += 1
    end

  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    array = []

    Song.all.each do |song|
      if song.artist.name == input
        song_name = song.name
        genre_name = song.genre.name
        array << "#{song_name} - #{genre_name}"
      end
    end
    counter = 1
    array.sort.each do |song_and_genre|
      puts "#{counter}. #{song_and_genre}"
      counter += 1
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    genre_array = []

    Song.all.each do |song|
      if song.genre.name == input
        song_name = song.name
        artist_name = song.artist.name
        genre_array << "#{artist_name} - #{song_name}"
      end
    end

    sorted_genre_array = genre_array.sort do |a, b|
      if a.split(" - ")[1] == b.split(" - ")[1]
        0
      elsif a.split(" - ")[1] < b.split(" - ")[1]
        -1
      elsif a.split(" - ")[1] > b.split(" - ")[1]
        1
      end
    end

    counter = 1
    sorted_genre_array.each do |artist_and_song|
      puts "#{counter}. #{artist_and_song}"
      counter += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    if (1...Song.all.length).include?(input)
       song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song

  end

end
