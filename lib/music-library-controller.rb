require 'pry'

class MusicLibraryController
  attr_accessor :path 
  
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    answer = ""
    while answer != "exit"
      answer = gets.strip.downcase 
      list_songs
      list_artist
      play_song
    end
  end

  def list_songs
    Song.all.each_with_index do |song, i| 
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist
    Artist.all.each_with_index { |artist, i| puts "#{i+1}. #{artist}"}
  end

  def list_genre
    Genre.all.each_with_index { |genre, i| puts "#{i+1}. #{genre}"}
  end

  def play_song
    puts "Playing #{Song.all[0].artist.name} - #{Song.all[0].name} - #{Song.all[0].genre.name}"
  end
end