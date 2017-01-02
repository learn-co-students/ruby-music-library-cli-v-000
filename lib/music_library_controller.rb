class MusicLibraryController

  require 'pry'

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      puts "Welcome to my laboratory! Let's get started. What would you like me to do?"
      puts "For example, 'list songs' will return a list of songs. Give it a try!"
      input = gets.chomp
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        puts "What artist would you like to see?"
        input = gets.chomp
        list_artist(input)
      when "list genre"
        puts "Which genre would you like to see? For example, you can type 'dance'"
        input = gets.chomp
        list_genres(input)
      when "play song"
        play_song
      end
    end
  end

  def songs #returns track number + full song info
    Song.all.each_with_index {|song, i| puts "#{i + 1}. #{song.track}"}
  end

  def artists #returns only artist name
    Artist.all.each {|a| puts a.name}
  end

  def genres #returns only a list of song genres
    Genre.all.each {|g| puts g.name}
  end

  def play_song # selects song by number, returns "Playing" + name of full song

  end

  def list_artist #returns a list of specific artist's full songs after user selects artist

  end

  def list_genre #returns a list of full songs that match the selected genre

  end

end
