require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = ""
    until input == "exit"
      input = gets.chomp
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end 
  end

  def list_songs
    Song.all.sort_by! {|song| song.name.downcase}
    Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by! {|artist| artist.name.downcase}
    Artist.all.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort_by! {|genre| genre.name.downcase}
    Genre.all.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = ""
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist != nil
      artist.songs.sort_by! {|song| song.name}
      artist.songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = ""
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre != nil
      genre.songs.sort_by! {|song| song.name}
      genre.songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
      puts "Which song number would you like to play?"
      input = gets.chomp.to_i
      if input.between?(1, Song.all.length)
        Song.all.sort_by! {|song| song.name.downcase}
        puts "Playing #{Song.all[input - 1].name} by #{Song.all[input - 1].artist.name}"
      end
  end

end
