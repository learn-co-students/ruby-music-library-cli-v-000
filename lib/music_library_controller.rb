require 'pry'
  class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
    #@all_songs = Song.all
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
    while input = gets
      case input
      when "list songs"
        list_songs
        break
      when "list artists"
        list_artists
        break
      when "list genres"
        list_genres
        break
      when "list artist"
        list_songs_by_artist
        break
      when "list genre"
        list_songs_by_genre
        break
      when "play song"
        play_song
        break
      when "exit"
        break
      else
        puts "What would you like to do?"
      end
    end
  end

  def list_songs
    #@music_importer.import
    songs = []
    #print_songs = []
    Song.all.each do |song|
      songs << song
    end
    sorted_songs = songs.sort! {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    #print_songs.each {|song| puts "#{song}"}
    #binding.pry
  end

  def list_artists
    artists = []
    Artist.all.each do |artist|
      artists << artist
    end
    sorted_artists = artists.sort! {|a, b| a.name <=> b.name}
    sorted_artists.each_with_index do |artist, index|
      puts  "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = []
    Genre.all.each do |genre|
      genres << genre
    end
    sorted_genres = genres.sort! {|a, b| a.name <=> b.name}
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    songs = []
    if artist != nil
      artist.songs.each do |song|
        songs << song
      end
    end

    sorted_songs = songs.sort! {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_by_name(genre_name)
    songs  = []
    if genre != nil
      genre.songs.each do |song|
        songs << song
      end
    end
    sorted_songs = songs.sort! {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i

    #binding.pry
    if input >= 1 && input <= Song.all.length
      songs = []
      #print_songs = []
      Song.all.each do |song|
        songs << song
      end
      sorted_songs = songs.sort! {|a, b| a.name <=> b.name}
      sorted_songs.each_with_index do |song, index|
        if index + 1 == input
          #binding.pry
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end

  end

end
