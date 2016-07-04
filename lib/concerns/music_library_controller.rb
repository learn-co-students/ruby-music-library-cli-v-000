require 'pry'
class MusicLibraryController
  attr_reader :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to the Music CLI Application\n"
    input = nil
    until input == 'exit'
      puts "What would you like to do?"
      input = (gets.strip).downcase
      case input
      when "list artists"
        artists
      when "list songs"
        songs
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def artists
    Artist.all.each.with_index(1) { |a, i| puts "#{i}. #{a.name}" }
  end

  def songs
    Song.all.each.with_index(1) { |s, i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def genres
    Genre.all.each.with_index(1) { |g, i| puts "#{i}. #{g.name}"}
  end

  def play_song
    puts "Enter the number of the song you would like to play"
    input = gets.strip
    song = Song.all[input.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "Enter the artist"
    input = gets.strip
    artist = Artist.find_by_name(input)
    artist.songs.each { |s| puts "#{artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_genre
    puts "Enter the genre"
    input = gets.strip
    genre = Genre.find_by_name(input)
    genre.songs.each { |s| puts "#{s.artist.name} - #{s.name} - #{genre.name}"}
  end
end
