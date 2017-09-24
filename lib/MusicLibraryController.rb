require_relative '../concerns/findable.rb'
require 'pry'


class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call


    input = ''
    while input != 'exit'
      puts 'Welcome to your music library!'
      puts 'What would you like to do?'
      input = gets.strip
      case input

      when 'list songs'
        list_songs
      when 'list artists'
        list_artist
      when 'list genres'
        list_genres
      when 'play song'
        play_song
      when "list artist"
        artists_songs
      when "list genre"
        genres_songs

      end

    end




  end


  def list_songs
     Song.all.sort_by{|s|s.artist.name}.each_with_index do |song, index|
       puts "#{index +1 }. #{song.artist.name.to_s} - #{song.name.to_s} - #{song.genre.name}"
     end
   end

   def list_artist
     Song.all.each{|song| puts  "#{song.artist.name}"}

   end

   def list_genres
     Song.all.each{|song| puts "#{song.genre.name}" }

   end

   def play_song
     Song.all.sort_by{|s|s.artist.name}.each do |song|
       puts "Playing #{song.artist.name.to_s} - #{song.name.to_s} - #{song.genre.name}"
     end
   end

   def artists_songs
     Song.all.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
   end

   def genres_songs
     Song.all.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

   end


end
