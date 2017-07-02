require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    input = ""
    number = "0"
    artist = ""
    genre = ""
    while input !="exit"
      puts "Welcome to your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        @importer.list_songs
      when "list artists"
        Artist.list_artists
      when "list genres"
        Genre.list_genres
      when "play song"
        puts "Which song would you like to play?"
        gets number.strip
        puts "Playing #{@importer.get_song(number.to_i)}"
      when "list artist"
        puts "Which artist would you like to see?"
        artist = gets.strip
        @importer.list_artist_songs(artist)
      when "list genre"
        puts "Which genre would you like to see?"
        genre = gets.strip
        @importer.list_genre_songs(genre)
      end
    end
  end
end
