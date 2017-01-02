class MusicLibraryController

  require 'pry'

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to my laboratory!"
      puts "Let's get started. What would you like me to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end


  def songs
		Song.all.each_with_index(1) do |s, i|
			puts "#{i}. #{s}"
		end
	end


end
