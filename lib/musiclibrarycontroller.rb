class MusicLibraryController
  attr_accessor :importer

  def initialize(path = './db/mp3s')
    self.importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts 'Welcome to your music library!'
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts 'What would you like to do?'
    loop do
      input = gets
      break if input == 'exit'

      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts 'Please enter the name of an artist:'
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    if artist
      artist.songs
            .sort_by(&:name)
            .each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts 'Please enter the name of a genre:'
    genre_name = gets
    genre = Genre.find_by_name(genre_name)
    if genre
      genre.songs
           .sort_by(&:name)
           .each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    n = gets.strip.to_i
    if n > 0 && n <= Song.all.size
      song = Song.all.sort_by(&:name)[n - 1]
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end
end
