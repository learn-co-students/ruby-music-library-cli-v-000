require 'pry'
class MusicLibraryController

  attr_accessor :song_path

  def initialize(path = "./db/mp3s")
    @song_path = MusicImporter.new(path)
    @song_path.import
  end

  def call
    answer = nil
    while (answer != "exit")
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.chomp

      list_songs if answer == "list songs"
      list_artists if answer == "list artists"
      list_genres if answer == "list genres"
      list_songs_by_artist if answer == "list artist"
      list_songs_by_genre if answer == "list genre"
      play_song if answer == "play song"

    end

  end

  def list_songs
    sorted_by_name = Song.all.sort_by {|song| song.name}
    sorted_by_name.collect.with_index(1) {|song, idx| puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}" if song != nil}
  end

  def list_artists
    sorted_by_artist_name = Artist.all.sort_by {|artist| artist.name}
    sorted_by_artist_name.collect.with_index(1) {|artist, idx| puts "#{idx}. #{artist.name}"}
  end

  def list_genres
    sorted_by_genre_name = Genre.all.sort_by {|genre| genre.name}
    sorted_by_genre_name.collect.with_index(1) {|genre, idx| puts "#{idx}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    query_artist = gets.chomp
    selected_artist_songs = Song.all.select {|song| song if song.artist.name == query_artist}
    sorted_by_song_name = selected_artist_songs.sort_by {|song| song.name}
    sorted_by_song_name.collect.with_index(1) {|song, idx| puts "#{idx}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    query_genre = gets.chomp
    selected_genre_songs = Song.all.select {|song| song if song.genre.name == query_genre}
    sorted_by_song_name = selected_genre_songs.sort_by {|song| song.name}
    sorted_by_song_name.collect.with_index(1) {|song, idx| puts "#{idx}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    number_selection  = gets.chomp.to_i
    sorted_by_name = Song.all.sort_by {|song| song.name}
    if (number_selection < sorted_by_name.length && number_selection > 0)
      puts "Playing #{(sorted_by_name[number_selection - 1]).name} by #{(sorted_by_name[number_selection - 1]).artist.name}"
    end
  end

end
