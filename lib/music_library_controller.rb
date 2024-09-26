require 'pry'

class MusicLibraryController
  attr_accessor :path, :files, :name

  def initialize(path = './db/mp3s')
    @path = path
    @files = MusicImporter.new(path)
    importer = files.import
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
    if input == 'list songs'
      list_songs
    elsif input == 'list artists'
      list_artists
    elsif input == 'list genres'
      list_genres
    elsif input == 'list artist'
      list_songs_by_artist
    elsif input == 'list genre'
      list_songs_by_genre
    elsif input == 'play song'
      play_song
    end
    call unless input == 'exit'
  end



  def list_songs
    sorted_files = Song.all.sort_by{|song| song.name}
    sorted_files.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.map {|artist| artist.name}.sort.uniq
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.map {|genre| genre.name}.sort.uniq
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist_songs = Song.all.select {|song| song.artist.name == input}
    sorted_songs = artist_songs.sort_by{|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre_songs = Song.all.select {|song| song.genre.name == input}
    sorted_songs = genre_songs.sort_by{|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    sorted_files = Song.all.sort_by{|song| song.name}
    if (1..sorted_files.size).include?(input)
      puts "Playing #{sorted_files[input-1].name} by #{sorted_files[input-1].artist.name}"
    end
  end
end
