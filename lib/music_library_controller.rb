require 'pry'

class MusicLibraryController
  
  attr_accessor :path
  
  @@options = ["list songs", "list artists", "list genres", "play song", "list artist", "list genre", "exit"]
  
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    user_input = nil
    puts "What would you like to do?\n\nYou can say things like #{@@options}\n\n"
    until user_input == "exit"
      user_input = gets.strip
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      end
    end
  end
  
  def list_songs
    Song.all.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.each {|x| puts "#{x.name}"}
  end
  
  def list_genres
    Genre.all.each {|x| puts "#{x.name}"}
  end
  
  def play_song
    puts "What song would you like to hear?"
    song_request = gets.strip
    puts "Playing #{Song.all[song_request.to_i - 1].artist.name}" + " - #{Song.all[song_request.to_i - 1].name}" + " - #{Song.all[song_request.to_i - 1].genre.name}"
  end
  
  def list_artist_songs
    puts "Enter an artist's name to see all their songs."
    artist_input = gets.strip
    artist = Artist.find_by_name(artist_input)
    if Artist.find_by_name(artist_input) then
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_genre_songs
    puts "Enter the genre to see all it's songs."
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
end