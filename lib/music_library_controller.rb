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
        list_artist
      when "list genre"
        list_genre
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
    i = -1
    begin
      puts "Select a song by its corresponding number, please."
      i = gets.chomp.to_i - 1
    end until i.between?(0, Song.all.count - 1)
      psong = Song.all[i]
      puts "Playing #{psong.track}"
  end

  def list_artist #returns a list of specific artist's full songs after user selects artist
    self.artists
    artist = nil # >> already defined?!
    begin
      puts "Select an artist by entering their name, please."
      lartist = Artist.find_by_name(gets.chomp)
    end until lartist
    lartist.songs.each { |song| puts song.track}
  end

  def list_genre #returns a list of full songs that match the selected genre
    self.genres
    genre = nil # >> already defined?!
    begin
      puts "Select a genre by entering its name, please."
      lgenre = Genre.find_by_name(gets.chomp)
    end until lgenre
    lgenre.songs.each { |song| puts song.track}
  end

end
