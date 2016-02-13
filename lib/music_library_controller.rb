require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
    sort_songs
  end

  def call
    input = ''

    while input != 'exit'
      input = gets.chomp
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'play song'
        play_song
      when 'list artist'
        list_artist
      when 'list genre'
        list_genre
      end
    end
  end

  def sort_songs
    @songs = Song.all
    @songs.sort! do |a, b|
      (a.artist.name <=> b.artist.name).nonzero? ||
        (a.name <=> b.name)
    end
  end

  def list_songs
    @songs.each_with_index do |song, index|
      print "#{index + 1}. "
      print_song(song)
    end
  end

  def list_artists
    Artist.all.sort! { |a, b| a.name <=> b.name }.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.sort! { |a, b| a.name <=> b.name }.each { |genre| puts genre.name }
  end

  def play_song
    input = gets.chomp.to_i
    song = @songs[input - 1]
    print 'Playing '
    print_song(song)
  end

  def list_artist
    input = gets.chomp
    @songs.each { |song| print_song(song) if song.artist.name == input }
  end

  def list_genre
    input = gets.chomp
    @songs.each { |song| print_song(song) if song.genre.name == input }
  end

  def print_song(song)
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
