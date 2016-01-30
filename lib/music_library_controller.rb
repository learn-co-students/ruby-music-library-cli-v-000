require 'pry'

class MusicLibraryController
  #attr_accessor :path

  def initialize(path = "./db/mp3s")
      MusicImporter.new(path).import
      @songs = Song.all
      @songs.sort! { |a,b| a.artist.name <=> b.artist.name }  #my songs dont get printed in order otherwise
  end

  def call
    loop do
      input = gets.chomp
        case input
          when "list songs"
            list_songs
          when "list artists"
            list_artists
          when "list genres"
            list_genres
          when "play song"
            play_song
          when "list artist"
            list_artist
          when "list genre"
            list_genre
        end
      break if input == "exit"
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Song.all.each_with_index do |song, index|
      puts "#{index+1}." " #{song.artist.name}"
    end
  end

  def list_genres
    Song.all.each_with_index do |song, index|
      puts "#{index+1}." " #{song.genre.name}"
    end
  end

  def play_song
     input = gets.chomp.to_i
    puts "Playing #{@songs[input - 1].artist.name} - #{@songs[input - 1].name} - #{@songs[input - 1].genre.name}"
  end

  def list_artist
    artist = gets.chomp
    Song.all.each_with_index do |song, index|
      if artist == song.artist.name
            puts "#{@songs[index].artist.name} - #{@songs[index].name} - #{@songs[index].genre.name}"
      end
    end
  end

  def list_genre
    genre = gets.chomp
    Song.all.each_with_index do |song, index|
      if genre == song.genre.name
            puts "#{@songs[index].artist.name} - #{@songs[index].name} - #{@songs[index].genre.name}"
      end
    end
  end

end