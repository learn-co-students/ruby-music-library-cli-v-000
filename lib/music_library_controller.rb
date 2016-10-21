require 'pry'

class MusicLibraryController
  attr_accessor :path
  @music_importer = []

  def initialize(path = "./db/mp3s")
    self.path = path if path != "./db/mp3s"
    @music_importer = MusicImporter.new(path).import
  end

  def call
    input = nil
    until input == "exit"
      choices
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_songs
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      end
    end
  end

  def choices
    puts "What would you like to do?"
    puts "list songs"
    puts "list artists"
    puts "list genres"
    puts "play song"
    puts "list artist"
    puts "list genre"
  end

  def list_songs
    @music_importer.sort.each_with_index {|song, index| puts "#{index+1}. #{song.chomp(".mp3")}"}
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_songs
    puts "What song would you like to play?"
    list_songs
    puts "Enter the song number:"
    song_number = gets.strip.to_i
    @music_importer.sort!
    puts "Playing #{@music_importer[song_number-1].chomp(".mp3")}"
  end

  def list_artist_songs
    puts "Which Artist's songs would you like to see?"
    list_artists
    puts "Enter the Artist's name:"
    artist_input = gets.strip
    Song.all.each do |song|
      if song.artist.name == artist_input
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre_songs
    puts "Which Genre songs would you like to see?"
    list_genres
    puts "Enter the Genre:"
    genre_input = gets.strip
    Song.all.each do |song|
      if song.genre.name == genre_input
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end
