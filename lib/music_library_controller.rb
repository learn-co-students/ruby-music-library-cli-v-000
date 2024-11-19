require 'pry'

class MusicLibraryController
  attr_accessor

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
#Initialize Music Library CLI With Call -- Accept Input & List Info About Library // Play Songs

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp

#CLI Commands

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

    call if input != "exit"
    
  end

  def list_songs
    songs = Song.all.sort_by {|song| song.name}
    songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    artists = Artist.all.collect {|artist| artist.name}.uniq.sort
    artists.each_with_index {|artist, index| puts "#{index+1}. #{artist}"}
  end

  def list_genres
    genres = Genre.all.collect {|genre| genre.name}.uniq.sort
    genres.each_with_index {|genre, index| puts "#{index+1}. #{genre}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    songs = artist.songs.sort_by {|song| song.name} if artist
    songs.each_with_index {|i, index| puts "#{index+1}. #{i.name} - #{i.genre.name}"} if artist
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    genres = genre.songs.sort_by {|song| song.name} if genre
    genres.each_with_index {|i, index| puts "#{index+1}. #{i.artist.name} - #{i.name}"} if genre
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if input > 0 && input <= Song.all.length
      songs = Song.all.sort_by {|song| song.name}[input - 1]
    end
    puts "Playing #{songs.name} by #{songs.artist.name}" if songs
  end
end
