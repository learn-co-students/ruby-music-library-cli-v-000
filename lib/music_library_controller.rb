require 'pry'

class MusicLibraryController

  extend Concerns::Findable
  include 

  attr_accessor :mpath

  def initialize(mpath="./db/mp3s")
    m = MusicImporter.new(mpath)
    m.import
  end

  def call
    user_input = nil
    while user_input != "exit"
      puts "\nPlease enter a selection or exit:"
      user_input = gets.chomp
      case user_input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end # case
    end # while loop
  end # call

  def songs
    Song.all.each_with_index {|song, idx| puts "#{idx+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def artists
    Artist.all.each {|artist| puts artist.name}
  end

  def genres
    Genre.all.each {|genre| puts genre.name}
  end

  def list_artist
    puts "Please enter the artist name for a list of their songs."
    artist_input = gets.chomp
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each {|song| puts "#{artist.name} - #{song.name} - #{song.genre.name}"}
    else
      puts "Artist was not found. Please check the spelling and enter again."
    end
  end

  def list_genre
    puts "Please enter a genre for a list of songs."
    genre_input = gets.chomp
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
  end

  def play_song
    puts "Please enter the song number to play."
    song_input = gets.chomp
    song_num = song_input.to_i - 1
    song_choice = Song.all[song_num]
    puts "Playing #{song_choice.artist.name} - #{song_choice.name} - #{song_choice.genre.name}"
  end
end
