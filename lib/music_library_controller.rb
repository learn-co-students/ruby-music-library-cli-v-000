require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
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
    elsif input != 'exit'
      call
    end
  end

  def list_songs #"1. Thundercat - For Love I Come - dance")
    songs_by_name = Song.all.collect {|s| s.name}
    sorted = songs_by_name.sort!
    sorted.each_with_index do |s, i|
      song = Song.find_by_name(s)
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists #("1. Action Bronson")
    artists_by_name = Artist.all.collect {|a| a.name}
    sorted = artists_by_name.sort!
    sorted.each_with_index do |a, i|
      artist = Artist.find_by_name(a)
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres #("1. country")
    genres_by_name = Genre.all.collect {|g| g.name}
    sorted = genres_by_name.sort!
    sorted.each_with_index do |g, i|
      genre = Genre.find_by_name(g)
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist #("1. Green Aisles - country")
    found = false
    if found == false
      puts "Please enter the name of an artist:"
      input = gets.strip
      if Artist.find_by_name(input)
        found = true
        artist = Artist.find_by_name(input)
        songs_by_artist = artist.songs.collect {|s| s.name}
        sorted = songs_by_artist.sort!
        sorted.each_with_index do |s, i|
          song = Song.find_by_name(s)
          puts "#{i + 1}. #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre #("1. Real Estate - It's Real")
    found = false
    if found == false
      puts "Please enter the name of a genre:"
      input = gets.strip
      if Genre.find_by_name(input)
        found = true
        genre = Genre.find_by_name(input)
        songs_by_genre = genre.songs.collect {|s| s.name}
        sorted = songs_by_genre.sort!
        sorted.each_with_index do |s, i|
          song = Song.find_by_name(s)
          puts "#{i + 1}. #{song.artist.name} - #{song.name}"
        end
      end
    end
  end

  def play_song
    match = false
    if match == false
      puts "Which song number would you like to play?"
      input = gets.strip.to_i
      if input >= 1 && input <= Song.all.length
        match = true
        songs_by_name = Song.all.collect {|s| s.name}
        sorted = songs_by_name.sort!
        song_chosen = sorted[input - 1]
        song = Song.find_by_name(song_chosen)
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end



end