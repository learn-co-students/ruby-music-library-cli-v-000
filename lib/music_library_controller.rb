# Music Library Controller
class MusicLibraryController
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_input = ''
    while user_input != 'exit'
      puts 'Welcome to the Music Library!'
      puts 'What would you like to do?'
      user_input = gets.strip
      case user_input
      when 'list songs'
        songs
      when 'list artists'
        artists
      when 'list genres'
        genres
      when 'play song'
        play_song
      when 'list artist'
        list_songs
      when 'list genre'
        list_genre
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |song, i|
      puts "#{i}. #{song}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre}"
    end
  end

  def play_song
    songs
    song_number = gets.strip.to_i
    puts "Playing #{Song.all[song_number - 1]}"
  end

  def list_songs
    puts 'What artist by name you like to list songs for?'
    artists
    artist = Artist.find_by_name(gets.strip)
    artist.songs.each { |song, i| puts "#{i}. #{song}" } if artist
  end

  def list_genre
    puts 'What genre by name you like to list songs for?'
    genres
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    genre.songs.each { |song, i| puts "#{i}. #{song}" } if genre
  end
end
