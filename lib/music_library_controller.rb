require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    new_importer = MusicImporter.new(path)
    new_importer.import
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
    user_input = ""
    while user_input != "exit"

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
    sorted_songs = Song.all.sort_by {|song| song.name}.uniq
    sorted_songs.each_with_index {|song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist|
      artist.name}

    sorted_artists.each_with_index{|artist, index|
      puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre|
      genre.name}
    sorted_genres.each_with_index{|genre, index|
      puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    selected_artist = Artist.all.detect {|artist| artist.name == artist_name}
    selected_songs = Song.all.select {|song| song.artist == selected_artist}
    sorted_songs = selected_songs.sort_by {|song| song.name}.uniq
    sorted_songs.each_with_index {|song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    selected_genre = Genre.all.detect {|genre| genre.name == genre_name}
    selected_songs = Song.all.select {|song| song.genre == selected_genre}
    sorted_songs = selected_songs.sort_by {|song| song.name}.uniq
    sorted_songs.each_with_index {|song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"}

  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip

    sorted_songs = Song.all.sort_by {|song| song.name}.uniq
    if (1..sorted_songs.count).include?(song_number.to_i)
      song = sorted_songs[song_number.to_i - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end


end
