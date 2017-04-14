class MusicLibraryController
  attr_accessor :importer

  def initialize(path = './db/mp3s')
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    input = ""
    while  input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
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
    Song.all.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end
  
  def genres
    Genre.all.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

end
