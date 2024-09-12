class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_input = ""
    while user_input != "exit"
      user_input = gets.strip

      case user_input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list song"
        list_song
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
    count = 1
    Song.all.each do |song|
      puts "#{count}. #{song}"
      count += 1
    end
  end

  def genres
    count = 1
    Genre.all.each do |genre|
      puts "#{count}. #{genre}"
      count += 1
    end
  end

  def artists
    count = 1
    Artist.all.each do |artist|
      puts "#{count}. #{artist}"
      count += 1
    end
  end

  def play_song
    user_request = gets.strip
    count = 1
    Song.all.each do |song|
      if count == user_request.to_i
        return puts "Playing #{song}"
      else
        count += 1
      end
    end
  end

  def list_artist
    user_request = gets.strip
    artist = Artist.find_by_name(user_request)
    artist.songs.each do |song|
      puts song
    end
  end

  def list_genre
    user_request = gets.strip
    genre = Genre.find_by_name(user_request)
    genre.songs.each do |song|
      puts song
    end
  end
end
