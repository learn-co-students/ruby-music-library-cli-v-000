require "pry"
class MusicLibraryController

attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    path = MusicImporter.new(path).import  # creates a MusicImporter with that path and imports the music
  end

  def call
    input=""
    invalid = "invalid command. Must be typed exactly."
    puts "Choose One from these options:"
    puts "1. list songs"
    puts "2. list artists"
    puts "3. list genres"
    puts "4. play song"
    puts "5. list artist"
    puts "6. list genre"
    puts "7. exit"

    while input !="exit"
      input = gets.strip
      case input
      when 'list songs'
        songs
      when 'list artists'
        artists
      when 'list genres'
        genres
      when 'play song'
        play_songs
      when 'list artist'
        songs
      when 'list genre'
        songs
      when 'exit'
        puts 'You have now left the Music Library.'
      else
        puts invalid
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

  # allows a user to play songs
  def play_songs
    MusicImporter.new(path).play_song
  end

end
