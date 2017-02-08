require_relative '../config/environment.rb'
require 'pry'

class MusicLibraryController

  extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      input = gets
      if input == "list songs"
        Song.all.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      elsif input == "list artists"
        Song.all.uniq.each_with_index {|song, index| puts "#{song.artist.name}"}

      elsif input == "list genres"
        Song.all.uniq.each_with_index {|song, index| puts "#{song.genre.name}"}

      elsif input == "play song"
        song_number = gets.to_i
        puts "Playing #{Song.all[song_number-1].artist.name} - #{Song.all[song_number-1].name} - #{Song.all[song_number-1].genre.name}"

      elsif input == "list artist"
        artist_input = gets
        output_songs = Artist.find_by_name(artist_input).songs
        output_songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      elsif input == "list genre"
        genre_input = gets
        output_songs = Genre.find_by_name(genre_input).songs
        output_songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
    end
  end
end
