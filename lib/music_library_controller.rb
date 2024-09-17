require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    #binding.pry
    Song.all.sort_by!{|song| [song.artist.name, song.name]}
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
        when "play song"
          play_song
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        end
      end
    end

  #sorting to complete test
  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  #sorting to complete song
  def play_song
    puts "What song would you like to play today?"
    input = gets.strip
    song = Song.all[input.to_i - 1]
    puts "Playing #{song}."
  end

  def list_artist
    puts "What Artist are you looking for?"
    input = gets.strip
    artist = Artist.find_by_name(input)
    artist.songs.each do |artist, song|
      puts "#{artist}"
    end
  end
  
  def list_genre
    puts "What Genre are you looking for?"
    input = gets.strip
    genre = Genre.find_by_name(input)
    genre.songs.each do |genre, song|
      puts "#{genre}"
    end
  end


end