require "pry"
class MusicLibraryController

attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    path = MusicImporter.new(path).import  # creates a MusicImporter with that path and imports the music
  end

  def call
    input=""
    puts "list songs"
    puts "exit"
    puts "Choose One from these options:"
    while input !="exit"
      input = gets.strip
      case input
      when 'list songs'
        songs
      when 'list artists'
        artists
      when 'list genres'
        genres
      end
    end
  end

  # allows a user to list songs
  def songs
    MusicImporter.new(path).print_songs
  end

  # allows a user to list artists
  def artists
    MusicImporter.new(path).print_artists
  end

  # allows a user to list genres
  def genres
    MusicImporter.new(path).print_genres
  end

end
