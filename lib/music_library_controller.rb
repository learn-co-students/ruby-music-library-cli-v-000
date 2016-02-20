class MusicLibraryController
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_input = ''
    while user_input != 'exit'
      puts "Hello, from here you can 'list songs', 'list artists', 'list genres', 'list artist', 'list genre', or 'play song'"
      puts 'Please type what you would like to do.'
      user_input = gets.chomp
      case user_input
      when 'list songs'
        songs
      when 'list artists'
        artists
      when 'list genres'
        genres
      when 'list artist'
        list_artist
      when 'list genre'
        list_genre
      when 'play song'
        play_song
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
    puts 'Please enter the track number you would like to play.'
    track = gets.chomp
    puts "Playing #{Song.all[track.to_i - 1].artist.name} - #{Song.all[track.to_i - 1].name} - #{Song.all[track.to_i - 1].genre.name}"
  end

  def list_artist
    puts 'Please enter which artist you would like a tracklist for.'
    artist = gets.chomp
    Song.all.collect { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" unless song.artist.name != artist }
  end

  def list_genre
    puts 'Please enter which genre you would like a song list for.'
    genre = gets.chomp
    Song.all.collect { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" unless song.genre.name != genre }
  end
end
