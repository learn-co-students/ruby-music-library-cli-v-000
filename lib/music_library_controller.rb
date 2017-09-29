require 'pry'

class MusicLibraryController
  attr_accessor :call

  def initialize(path = './db/mp3s')
    music = MusicImporter.new(path)
    music.import
    # @call= call
  end

  def call

    input = nil

    until input == "exit"

    input = gets.chomp
      case input
      when "list songs"
        songs
      when "list artists"
        Artist.all.map do |artist|
          puts artist.name
        end
      when "list genres"
        Genre.all.map do |genre|
          puts genre.name
        end
      when "play song"
        play_song
      when "list artist"
        list_artists_songs
      when "list genre"
        list_genre
      end
    end
  end

  def songs
    Song.all.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def play_song
    puts "Please enter a song number:"
    song_number = gets.chomp.to_i
    selected_song = Song.all[song_number-1]
    puts "Playing #{selected_song.artist.name} - #{selected_song.name} - #{selected_song.genre.name}"
  end

  def list_artists_songs
    selected_artist = Artist.find_by_name(gets.strip)
    selected_artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
    genre = Genre.find_by_name(gets.strip)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end

