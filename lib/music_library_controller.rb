class MusicLibraryController
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path).import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to the Music CLI. These are the following options: list songs, list artists, list genres. What would you like to do?"
      user_input = gets.chomp
      case user_input
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
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Song.all.each do |song|
      puts "#{song.artist.name}"
    end
  end

  def genres
    Song.all.each do |song|
      puts "#{song.genre.name}"
    end
  end

  def play_song
    user_track = gets.chomp
    puts "Playing #{Song.all[user_track.to_i - 1].artist.name} - #{Song.all[user_track.to_i - 1].name} - #{Song.all[user_track.to_i - 1].genre.name}"
  end

  def list_artist
    artist = gets.chomp
    Song.all.collect do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    genre = gets.chomp
    Song.all.collect do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
