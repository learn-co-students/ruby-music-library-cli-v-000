require 'pry'

class MusicLibraryController

  attr_accessor :files

  def initialize(path = './db/mp3s')
    @path = path
    new_importer = MusicImporter.new(path)
    new_importer.import
  end


  def call
    user_input = ""
    while user_input != 'exit'

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = gets.strip
  end
  end

  def list_songs
     sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
     sorted_songs.each.with_index(1) {|song, num| puts "#{num}. #{song.artist.name.gsub("./spec/fixtures/other_mp3s/", "")} - #{song.name} - #{song.genre.name}"}
  end


  def list_artists
    sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
    sorted_artists.each.with_index(1) {|artist, num| puts "#{num}. #{artist.name.gsub("./spec/fixtures/other_mp3s/", "")}"}
  end

  def list_genres
    sorted_genres = Genre.all.sort {|a, b| a.name <=> b.name}
    sorted_genres.each.with_index(1) {|genre, num| puts "#{num}. #{genre.name}"}
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs
      sorted_songs = artist.songs.sort {|a, b| a.name <=> b.name}
      sorted_songs.each.with_index(1) {|song, num| puts "#{num}. #{song.name} - #{song.genre.name}"}


    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre.songs
      sorted_genres = genre.songs.sort {|a, b| a.name <=> b.name}
      sorted_genres.each.with_index(1) {|song, num| puts "#{num}. #{song.artist.name} - #{song.name}"}
  end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i
    song = Song.all.sort {|a, b| a.name <=> b.name}[song_num]
    puts "Playing #{song.name} by #{song.artist.name}" if song#.name == Song.all[song_num]
    binding.pry

  end
end
