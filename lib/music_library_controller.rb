require 'pry'
class MusicLibraryController

  attr_accessor :path, :import

  def initialize(path = './db/mp3s')
    @music_importer = MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != 'exit'
      input=gets.strip
      case input
      when 'list songs'
        songs
      when 'list artists'
        artists
      when 'list genres'
        genres
      when 'play song'
        play_song
      when 'list artist'
        artists_songs
      when 'list genre'
        genres_songs
    end
    end
  end

  def songs
    sorted_array = Song.all.sort_by{|s| s.artist.name}
    sorted_array.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index {|artist| puts "#{artist.name}"}
  end

  def genres
    Genre.all.each_with_index {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "What song number would you like to play?"
    song_number = gets.chomp.to_i
    sorted_array = Song.all.sort_by{|s| s.artist.name}
    puts "Playing #{sorted_array[song_number-1].artist.name} - #{sorted_array[song_number-1].name} - #{sorted_array[song_number-1].genre.name}"
  end

  def artists_songs
    puts "Which artist would you like?"
    choice = gets.chomp
    Song.all.each do |song|
      if song.artist.name == choice
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def genres_songs
    puts "Which genre would you like?"
    choice = gets.chomp
    Song.all.each do |song|
      if song.genre.name == choice
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end


