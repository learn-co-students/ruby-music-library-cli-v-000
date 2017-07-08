require 'pry'

class MusicLibraryController
  attr_accessor :path, :filenames

  def initialize(path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    @filenames = music_importer.import
  end

  def call
    input = ''
    @filenames.sort!

    until input == 'exit'
      puts "Enter Input:"
      input = gets

      case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'play song'
        self.play_song
      when 'list artist'
        self.artist_songs
      when 'list genre'
        self.genre_songs
      end

    end
  end

  def list_songs
    position = 1
    @filenames.each do |name|
      puts "#{position}. #{name.chomp('.mp3')}"
      position += 1
    end
  end

  def list_artists
    @filenames.each do |name|
      puts "#{name.split(" - ")[0]}"
    end
  end

  def list_genres
    @filenames.each do |name|
      puts "#{name.split(" - ")[2].chomp('.mp3')}"
    end
  end

  def play_song
    puts "Which song?:"
    song = gets.to_i
    song-= 1
    puts"Playing #{@filenames[song].chomp('.mp3')}"
  end

  def artist_songs
    puts "Which Artist?:"
    artist = gets
    artist_songs = @filenames.select {|name| name.start_with?(artist)}
    puts"#{artist_songs}"
  end

  def genre_songs
    puts "Which Artist?:"
    genre = gets
    genre = genre +".mp3"
    genre_songs = @filenames.select {|name| name.end_with?(genre)}
    puts"#{genre_songs}"
  end
end
