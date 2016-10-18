class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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
    num = 1
    Song.all.each do |song|
      puts "#{num}. #{song.artist} - #{song.name} - #{song.genre.name}"
      num +=1
    end
  end

  def artists
    num = 1
    Artist.all.each do |artist|
      puts "#{artist}"
      num +=1
    end
  end

  def genres
    num = 1
    Genre.all.each do |genre|
      puts "#{genre.name}"
      num +=1
    end
  end

  def play_song
    Song.all.each do |song|
      puts "Playing #{song.artist} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist
    Artist.all.each do |artist|
      artist.songs.each do |song|
        puts "#{song.artist} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    Genre.all.each do |genre|
      genre.songs.each do |song|
        puts "#{song.artist} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end
