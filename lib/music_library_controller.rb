class MusicLibraryController

  require 'pry'

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      puts "Welcome to my laboratory! Let's get started. What would you like me to do?"
      puts "For example, 'list songs' will return a list of songs. Give it a try!"
      input = gets.chomp
    end
  end

  def list_songs #returns track number + full song info

  end

  def list_artists #returns only artist name

  end

  def list_genres #returns only a list of song genres

  end

  def play_song # selects song by number, returns "Playing" + name of full song

  end

  def list_artist #returns a list of specific artist's full songs after user selects artist

  end

  def list_genre #returns a list of full songs that match the selected genre

  end

end
