require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import

  end

  def call
    input = ""
    while input != "exit"
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
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def songs
    Song.all.each_with_index do |song, number|
      puts "#{number+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index do |artist, number|
      puts "#{number+1}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each_with_index do |genre, number|
      puts "#{number+1}. #{genre.name}"
    end
  end

  def list_artist
    
    puts "What artist by name you like to list songs for?"
    artist_input = gets.strip

    if artist = Artist.find_by_name(artist_input)
      artist
    end






  end





end
