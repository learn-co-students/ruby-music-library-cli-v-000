require_all 'lib'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    run = MusicImporter.new(path)
    run.import
  end

  def call
    input = nil
    while input != "exit"
      puts "Welcome!"
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
    Song.all.map.each_with_index do |song, num|
      puts "#{num+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index do |artist, num|
      puts "#{num+1}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each_with_index do |genre, num|
      puts "#{num+1}. #{genre.name}"
    end
  end

  def play_song
    puts "What song do you want to play?"
    input = gets.strip
    puts "Playing #{Song.all[input.to_i-1].artist.name} - #{Song.all[input.to_i-1].name} - #{Song.all[input.to_i-1].genre.name}"
  end

  def list_artist
    puts "What artist's song do you want to see?"
    input = gets.strip
    Song.all.collect do |finder|
      finder.artist.name.include?("input")
      puts "#{finder.artist.name} - #{finder.name} - #{finder.genre.name}"
    end
  end

  def list_genre
    puts "What genre do you want to see?"
    input = gets.strip
    Song.all.collect do |finder|
      finder.genre.name.include?("input")
      puts "#{finder.artist.name} - #{finder.name} - #{finder.genre.name}"
    end
  end



end